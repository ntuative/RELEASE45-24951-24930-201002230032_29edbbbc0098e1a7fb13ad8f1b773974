package com.sulake.habbo.sound.object
{
   import com.sulake.habbo.sound.IHabboSound;
   import flash.events.Event;
   import flash.media.Sound;
   import flash.media.SoundChannel;
   import flash.media.SoundTransform;
   
   public class HabboSound implements IHabboSound
   {
       
      
      private var var_963:SoundChannel = null;
      
      private var var_788:Boolean;
      
      private var var_964:Sound = null;
      
      private var var_706:Number;
      
      public function HabboSound(param1:Sound)
      {
         super();
         var_964 = param1;
         var_964.addEventListener(Event.COMPLETE,onComplete);
         var_706 = 1;
         var_788 = false;
      }
      
      public function get finished() : Boolean
      {
         return !var_788;
      }
      
      public function stop() : Boolean
      {
         var_963.stop();
         return true;
      }
      
      public function play() : Boolean
      {
         var_788 = false;
         var_963 = var_964.play(0);
         this.volume = var_706;
         return true;
      }
      
      public function set position(param1:Number) : void
      {
      }
      
      public function get volume() : Number
      {
         return var_706;
      }
      
      public function get ready() : Boolean
      {
         return true;
      }
      
      public function get position() : Number
      {
         return var_963.position;
      }
      
      public function get length() : Number
      {
         return var_964.length;
      }
      
      public function set volume(param1:Number) : void
      {
         var_706 = param1;
         if(var_963 != null)
         {
            var_963.soundTransform = new SoundTransform(var_706);
         }
      }
      
      private function onComplete(param1:Event) : void
      {
         var_788 = true;
      }
   }
}
