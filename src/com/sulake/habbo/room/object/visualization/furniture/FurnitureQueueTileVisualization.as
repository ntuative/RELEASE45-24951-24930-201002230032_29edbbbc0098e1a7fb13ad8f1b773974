package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureQueueTileVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1019:int = 1;
      
      private static const const_1036:int = 3;
      
      private static const const_1020:int = 2;
      
      private static const const_1021:int = 15;
       
      
      private var var_727:int;
      
      private var var_223:Array;
      
      public function FurnitureQueueTileVisualization()
      {
         var_223 = new Array();
         super();
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == const_1020)
         {
            var_223 = new Array();
            var_223.push(const_1019);
            var_727 = const_1021;
         }
         super.setAnimation(param1);
      }
      
      override protected function updateAnimation(param1:Number) : Boolean
      {
         if(var_727 > 0)
         {
            --var_727;
         }
         if(var_727 == 0)
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
