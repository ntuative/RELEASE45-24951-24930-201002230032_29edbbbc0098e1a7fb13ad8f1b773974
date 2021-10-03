package com.sulake.core.window.graphics.renderer
{
   import flash.geom.Rectangle;
   
   public class SkinLayoutEntity implements ISkinLayoutEntity
   {
      
      public static const const_233:uint = 1;
      
      public static const const_396:uint = 0;
      
      public static const const_928:uint = 8;
      
      public static const const_255:uint = 4;
      
      public static const const_349:uint = 2;
       
      
      private var var_407:uint;
      
      private var var_2103:uint;
      
      private var _color:uint;
      
      private var _name:String;
      
      private var var_2102:uint;
      
      private var var_90:Rectangle;
      
      private var var_589:Array;
      
      private var _id:uint;
      
      public function SkinLayoutEntity(param1:uint, param2:String, param3:Rectangle, param4:uint = 4.294967295E9, param5:uint = 100, param6:uint = 0, param7:uint = 0)
      {
         super();
         _id = param1;
         _name = param2;
         var_90 = param3;
         _color = param4;
         var_407 = param5;
         var_2103 = param6;
         var_2102 = param7;
         var_589 = new Array();
      }
      
      public function get scaleH() : uint
      {
         return var_2103;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get blend() : uint
      {
         return var_407;
      }
      
      public function get scaleV() : uint
      {
         return var_2102;
      }
      
      public function get tags() : Array
      {
         return var_589;
      }
      
      public function get id() : uint
      {
         return _id;
      }
      
      public function dispose() : void
      {
         var_90 = null;
         var_589 = null;
      }
      
      public function get color() : uint
      {
         return _color;
      }
      
      public function get region() : Rectangle
      {
         return var_90;
      }
   }
}
