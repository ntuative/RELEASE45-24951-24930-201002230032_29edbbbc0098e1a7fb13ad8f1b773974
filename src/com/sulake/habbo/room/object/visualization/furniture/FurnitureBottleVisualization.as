package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureBottleVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1036:int = -1;
      
      private static const const_726:int = 20;
      
      private static const const_476:int = 9;
       
      
      private var var_551:Boolean = false;
      
      private var var_223:Array;
      
      public function FurnitureBottleVisualization()
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
            var_223.push(const_1036);
            return;
         }
         if(param1 >= 0 && param1 <= 7)
         {
            if(var_551)
            {
               var_551 = false;
               var_223 = new Array();
               var_223.push(const_726);
               var_223.push(const_476 + param1);
               var_223.push(param1);
               return;
            }
            super.setAnimation(param1);
         }
      }
      
      override protected function updateAnimation(param1:Number) : Boolean
      {
         if(super.getLastFramePlayed(0))
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
