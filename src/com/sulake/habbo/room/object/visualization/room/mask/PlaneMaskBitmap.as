package com.sulake.habbo.room.object.visualization.room.mask
{
   import com.sulake.room.object.visualization.utils.IGraphicAsset;
   
   public class PlaneMaskBitmap
   {
      
      public static const const_31:Number = -1;
      
      public static const MAX_NORMAL_COORDINATE_VALUE:Number = 1;
       
      
      private var _normalMaxX:Number = 1;
      
      private var var_1566:Number = -1;
      
      private var var_726:IGraphicAsset = null;
      
      private var var_1565:Number = 1;
      
      private var var_1567:Number = -1;
      
      public function PlaneMaskBitmap(param1:IGraphicAsset, param2:Number = -1, param3:Number = 1, param4:Number = -1, param5:Number = 1)
      {
         super();
         var_1566 = param2;
         _normalMaxX = param3;
         var_1567 = param4;
         var_1565 = param5;
         var_726 = param1;
      }
      
      public function get normalMaxY() : Number
      {
         return var_1565;
      }
      
      public function get normalMaxX() : Number
      {
         return _normalMaxX;
      }
      
      public function get normalMinX() : Number
      {
         return var_1566;
      }
      
      public function get normalMinY() : Number
      {
         return var_1567;
      }
      
      public function get asset() : IGraphicAsset
      {
         return var_726;
      }
      
      public function dispose() : void
      {
         var_726 = null;
      }
   }
}