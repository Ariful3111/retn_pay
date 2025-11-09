import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class FirstOnboardingController extends GetxController with GetTickerProviderStateMixin{
  final int crossAxis=3;
  final List<ScrollController> columnController =[];
  final List<AnimationController> animControllers = [];
  final List <Animation<double>> scrollAnim = [];

  RxBool isPaused = false.obs;
  Timer ? scrollTimer;

  @override
  void onInit() {
    for(int i=0; i<crossAxis; i++){
      columnController.add(ScrollController());
      final anim=AnimationController(
      vsync: this,
      duration: Duration(seconds: 8)
    );

    final curve=CurvedAnimation(parent: anim, curve: Curves.linear);

    animControllers.add(anim);
    scrollAnim.add(curve);
    if(i.isEven){
      anim.repeat(reverse: true);
    }else{
      anim.repeat(reverse: true);
      anim.value = 1;
    }
    }
    linkAnimation();
    super.onInit();
  }

  void linkAnimation(){
    for(int i = 0; i<crossAxis; i++){
      animControllers[i].addListener((){
        final controller = columnController[i];
        if(controller.hasClients && controller.position.hasContentDimensions){
          final double maxScroll = controller.position.maxScrollExtent;
          controller.jumpTo(scrollAnim[i].value * maxScroll);
        }
      });
    }
  }

  void paused(){
    scrollTimer?.cancel();
    if(!isPaused.value){
      isPaused.value = true;
      for(var c in animControllers){
        c.stop();
      }
    }
  }

  void resume(){
    scrollTimer?.cancel();
    scrollTimer = Timer(Duration(seconds: 2), (){
      if(isPaused.value){
        isPaused.value = false;
        for(int i = 0; i<animControllers.length;i++){
          animControllers[i].repeat(reverse: true);
        }
      }
    });
  }

  @override
  void onClose() {
    scrollTimer?.cancel();
    for(var a in animControllers){
      a.dispose();
    }
    for(var s in columnController){
      s.dispose();
    }
    super.onClose();
  }

}