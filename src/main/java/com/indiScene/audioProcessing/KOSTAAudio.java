package com.indiScene.audioProcessing;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.FloatBuffer;

import javax.sound.sampled.AudioFileFormat;
import javax.sound.sampled.AudioInputStream;
import javax.sound.sampled.AudioSystem;
import javax.sound.sampled.LineUnavailableException;
import javax.sound.sampled.UnsupportedAudioFileException;

import be.tarsos.dsp.AudioDispatcher;
import be.tarsos.dsp.filters.HighPass;
import be.tarsos.dsp.filters.LowPassFS;
import be.tarsos.dsp.io.TarsosDSPAudioFormat;
import be.tarsos.dsp.io.jvm.JVMAudioInputStream;
import be.tarsos.dsp.io.jvm.WaveformWriter;

/**
 * @type : KOSTAAudio
 * @date : 2015. 7. 6.
 * @author : Kim Min Sic
 * @description : Class to processing Audio File (merge, reduce noise, audio save(wave file))
 */

public class KOSTAAudio {
	/**
	 * @name : mergeAudio
	 * @date : 2015. 7. 6.
	 * @author : Kim Min Sic
	 * @description : merge two diffrent audio file and save new one
	 */
	public String mergeAudio(String filePath1, String filePath2,String userId, double syncSecond){
		byte[] outArray = null;
		AudioInputStream ais1=null;
		AudioInputStream ais2=null;
		try {
			ais1= AudioSystem.getAudioInputStream(new File(filePath1));
			ais2= AudioSystem.getAudioInputStream(new File(filePath2));
			
			int numBytes1= ais1.available();
			int numBytes2= ais2.available();
			
			byte[] buffer1 = new byte[numBytes1];
			byte[] buffer2 = new byte[numBytes2];
			
			int count=0;
			while(count != -1){
				count=ais1.read(buffer1, 0, numBytes1);
			}
			count =0;
			while (count !=-1){
				count=ais2.read(buffer2,0,numBytes2);
			}
			outArray = new byte[Math.max(numBytes1, numBytes2)];
			System.out.println(buffer1.length +"\n" + buffer2.length+"\n"+outArray.length);
			
			long sync = (long)(syncSecond*ais1.getFormat().getSampleRate()*ais1.getFormat().getChannels()*ais1.getFormat().getSampleSizeInBits()/8);
			
			for(int i = 0 ; i < Math.max(buffer1.length, buffer2.length); i++){
				if(i < buffer1.length && i < buffer2.length){
					if(i <45){
						outArray[i] = buffer2[i];
					}else{
						if(sync>=0){
							if(i>=sync)
								outArray[i] = (byte) ((int)(buffer1[i]*0.5 + buffer2[i]*0.5));
							else
								outArray[i] = buffer1[i];
						}else{
							if(i>=(sync*(-1)))
								outArray[i] = (byte) ((int)(buffer1[i]*0.5 + buffer2[i]*0.5));
							else
								outArray[i] = buffer2[i];
						}
					}
				}else{
					outArray[i] = buffer1.length>buffer2.length?buffer1[i]:buffer2[i];
				}
			}
		} catch (UnsupportedAudioFileException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		String mergeFile = null;;
		String outputFilePath= null;
		try {
			mergeFile = makeFile(outArray,ais1.available()>ais2.available()?ais2:ais1,userId);
			outputFilePath = filters(mergeFile,userId);
		} catch (IOException e) {
			e.printStackTrace();
		} catch (UnsupportedAudioFileException e) {
			e.printStackTrace();
		} catch (LineUnavailableException e) {
			e.printStackTrace();
		}finally{
			File tempFile =new File(mergeFile);
			tempFile.delete();
		}
		
		return outputFilePath;
	}
	
	/**
	 * @name : makeFile
	 * @date : 2015. 7. 6.
	 * @author : Kim Min Sic
	 * @description : merged audio byte array to audio File / return new audio file path
	 */
	private String makeFile(byte[] byteBuffer, AudioInputStream ais, String userId) throws IOException{
		String timeName = userId+"_"+System.currentTimeMillis();
		String outputFilePath = "C:/SPB_Data/git/IndiScene/src/main/webapp/resources/MergeMusic/"+timeName;
		
		ByteArrayInputStream bais = new ByteArrayInputStream(byteBuffer);
		AudioSystem.write(new AudioInputStream(bais,ais.getFormat(),ais.getFrameLength()), AudioFileFormat.Type.WAVE, new File(outputFilePath));
		
		return outputFilePath;
	}
	
	/**
	 * @name : filters
	 * @date : 2015. 7. 6.
	 * @author : Kim Min Sic
	 * @description : analyze audio file to the frequency and cut off 100Hz ~ 4000Hz
	 */
	private String filters(String filePath,String userId) throws UnsupportedAudioFileException, IOException, LineUnavailableException{
		AudioInputStream ais=AudioSystem.getAudioInputStream(new File(filePath));
		TarsosDSPAudioFormat format = new TarsosDSPAudioFormat(ais.getFormat().getSampleRate(), ais.getFormat().getSampleSizeInBits(), ais.getFormat().getChannels(), true, ais.getFormat().isBigEndian());
		byte [] byteBuffer =audioToByteArray(ais);
		float[] floatBuffer = convertToFloat(byteBuffer);

		String timeName = userId+"_"+System.currentTimeMillis()+"_Collabo.wav";
		String outputFilePath = "C:/SPB_Data/git/IndiScene/src/main/webapp/resources/MergeMusic/"+timeName;
		
		
		ByteArrayInputStream bais = new ByteArrayInputStream(byteBuffer);
		AudioInputStream inputStream = new AudioInputStream(bais, JVMAudioInputStream.toAudioFormat(format),floatBuffer.length);
		JVMAudioInputStream jvmAudioInputStream = new JVMAudioInputStream(inputStream);
		
		AudioDispatcher dispatcher = new AudioDispatcher(jvmAudioInputStream,1,0);
		dispatcher.addAudioProcessor(new LowPassFS(4000,ais.getFormat().getSampleRate()));
		dispatcher.addAudioProcessor(new HighPass(100,ais.getFormat().getSampleRate()));
		dispatcher.addAudioProcessor(new WaveformWriter(format,outputFilePath));
		dispatcher.run();
		
		return outputFilePath;
	}
	
	/**
	 * @name : audioToByteArray
	 * @date : 2015. 7. 6.
	 * @author : Kim Min Sic
	 * @description : convert audio file to byte array
	 */
	private byte[] audioToByteArray(AudioInputStream ais){
		byte[] byteArray =null;
//		System.out.println("Audio To Byte Array Start");
		
		int arrayIndex;
		try {
			arrayIndex = ais.available();
			byteArray = new byte[arrayIndex];
			
			int count =0;
			while(count!=-1){
				count = ais.read(byteArray, 0, arrayIndex);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		
//		System.out.println("Audio To Byte Array End");
		return byteArray;
	}
	
	/**
	 * @name : convertToFloat
	 * @date : 2015. 7. 6.
	 * @author : Kim Min Sic
	 * @description : convert byte array to float array
	 */
	private float[] convertToFloat(byte[] array){
//		System.out.println("Convert To Float Start");
		int size=0;
		byte[] newArray = null;
		ByteBuffer buffer = null;
		if(array.length%4 != 0){
			size = array.length;
			do{
				size++;
			}while(size%8 !=0);
			
			newArray = new byte[size];

			System.arraycopy(array, 0, newArray, 0, array.length);
			for(int i=array.length; i<newArray.length; i++) newArray[i]=0;
			
			buffer = ByteBuffer.wrap(newArray);
		}else{
			buffer = ByteBuffer.wrap(array);
		}
		
		FloatBuffer floatBuffer = buffer.asFloatBuffer();
		float[] result = new float[floatBuffer.remaining()];
		floatBuffer.get(result);
		
//		System.out.println("Convert To Float Array End");
		return  result;
	}
}
