package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureHabboWheelVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1037:int = 31;
      
      private static const const_1036:int = 32;
      
      private static const const_726:int = 10;
      
      private static const const_476:int = 20;
       
      
      private var var_551:Boolean = false;
      
      private var var_223:Array;
      
      public function FurnitureHabboWheelVisualization()
      {
         var_223 = new Array();
         super();
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == -1)
         {
            var_551 = true;
            var_223 = new Array();
            var_223.push(const_1037);
            var_223.push(const_1036);
            return;
         }
         if(param1 > 0 && param1 <= const_726)
         {
            if(var_551)
            {
               var_551 = false;
               var_223 = new Array();
               var_223.push(const_726 + param1);
               var_223.push(const_476 + param1);
               var_223.push(param1);
               return;
            }
            super.setAnimation(param1);
         }
      }
      
      override protected function updateAnimation(param1:Number) : Boolean
      {
         if(super.getLastFramePlayed(1) && super.getLastFramePlayed(2) && super.getLastFramePlayed(3))
         {
            if(false)
            {
               super.setAnimation(var_223.shift());
            }
         }
         return super.updateAnimation(param1);
      }
   }
}
