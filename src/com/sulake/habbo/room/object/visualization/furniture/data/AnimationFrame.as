package com.sulake.habbo.room.object.visualization.furniture.data
{
   public class AnimationFrame
   {
      
      public static const const_701:int = -1;
      
      public static const const_776:int = -1;
       
      
      private var _y:int = 0;
      
      private var var_1847:int = -1;
      
      private var var_74:int = 0;
      
      private var var_1154:int = 1;
      
      private var var_782:int = 1;
      
      private var var_1845:Boolean = false;
      
      private var var_1846:int = 0;
      
      private var _id:int = 0;
      
      public function AnimationFrame(param1:int, param2:int, param3:int, param4:int, param5:Boolean, param6:int = -1, param7:int = 0)
      {
         super();
         _id = param1;
         var_74 = param2;
         _y = param3;
         var_1845 = param5;
         if(param4 < 0)
         {
            param4 = const_701;
         }
         var_782 = param4;
         var_1154 = param4;
         if(param6 >= 0)
         {
            var_1847 = param6;
            var_1846 = param7;
         }
      }
      
      public function get y() : int
      {
         return _y;
      }
      
      public function set remainingFrameRepeats(param1:int) : void
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         if(var_782 > 0 && param1 > var_782)
         {
            param1 = var_782;
         }
         var_1154 = param1;
      }
      
      public function get frameRepeats() : int
      {
         return var_782;
      }
      
      public function get activeSequenceOffset() : int
      {
         return var_1846;
      }
      
      public function get id() : int
      {
         if(_id >= 0)
         {
            return _id;
         }
         return -_id * Math.random();
      }
      
      public function get remainingFrameRepeats() : int
      {
         if(var_782 < 0)
         {
            return const_701;
         }
         return var_1154;
      }
      
      public function get activeSequence() : int
      {
         return var_1847;
      }
      
      public function get isLastFrame() : Boolean
      {
         return var_1845;
      }
      
      public function get x() : int
      {
         return var_74;
      }
   }
}
