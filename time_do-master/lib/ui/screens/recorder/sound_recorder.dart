import 'dart:io';

import 'package:flutter_sound_lite/flutter_sound.dart';
import 'package:permission_handler/permission_handler.dart';

class SoundRecorder{
  FlutterSoundRecorder? _audioRecorder;
  bool isRecorderReady=false;

  final pathToSaveAudio='audio_todo.aac';
  bool _isRecorderIntialised=false;
  bool get isRecording=> _audioRecorder!.isRecording;

  Future init() async{
    _audioRecorder=FlutterSoundRecorder();

    final status = await Permission.microphone.request();
    if(status!= PermissionStatus.granted){
      throw RecordingPermissionException('Microphone permission deny');
    }
    await _audioRecorder!.openAudioSession();
    _isRecorderIntialised=true;

    isRecorderReady=true;
  }

  Future dispose() async{
    _audioRecorder!.closeAudioSession();
    _audioRecorder=null;
    _isRecorderIntialised=false;
  }

  Future _record() async{

    if(!isRecorderReady) return;
    if(!_isRecorderIntialised) return;
    await _audioRecorder!.startRecorder(toFile: pathToSaveAudio);
  }

  Future _stop() async{
    if(!isRecorderReady) return;
    if(!_isRecorderIntialised) return;
    await _audioRecorder!.stopRecorder();

    final audioFile = File(pathToSaveAudio);
  }

  Future toggleRecording() async{
    if(_audioRecorder!.isStopped){
      await _record();
    }else{
      await _stop();
    }
  }
}