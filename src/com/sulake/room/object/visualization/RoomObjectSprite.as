package com.sulake.room.object.visualization
{
   import flash.display.BitmapData;
   import flash.geom.Point;
   
   public final class RoomObjectSprite implements IRoomObjectSprite
   {
      
      private static var var_1073:int = 0;
       
      
      private var _updateID:int = 0;
      
      private var var_1594:Boolean = false;
      
      private var var_1590:String = "normal";
      
      private var var_1129:String = "";
      
      private var _instanceId:int = 0;
      
      private var var_326:Boolean = true;
      
      private var _height:int = 0;
      
      private var var_1595:int = 255;
      
      private var _color:int = 16777215;
      
      private var var_919:Boolean = false;
      
      private var var_918:Boolean = false;
      
      private var var_1591:Boolean = false;
      
      private var _offset:Point;
      
      private var var_1593:Boolean = true;
      
      private var _width:int = 0;
      
      private var var_932:Number = 0;
      
      private var var_1592:String = "";
      
      private var var_726:BitmapData = null;
      
      public function RoomObjectSprite()
      {
         _offset = new Point(0,0);
         super();
         _instanceId = var_1073++;
      }
      
      public function set flipV(param1:Boolean) : void
      {
         var_918 = param1;
         ++_updateID;
      }
      
      public function set clickHandling(param1:Boolean) : void
      {
         var_1591 = param1;
         ++_updateID;
      }
      
      public function dispose() : void
      {
         var_726 = null;
         _width = 0;
         _height = 0;
      }
      
      public function get offsetX() : int
      {
         return _offset.x;
      }
      
      public function get offsetY() : int
      {
         return _offset.y;
      }
      
      public function get height() : int
      {
         return _height;
      }
      
      public function set blendMode(param1:String) : void
      {
         var_1590 = param1;
         ++_updateID;
      }
      
      public function set tag(param1:String) : void
      {
         var_1592 = param1;
         ++_updateID;
      }
      
      public function set assetName(param1:String) : void
      {
         var_1129 = param1;
         ++_updateID;
      }
      
      public function get varyingDepth() : Boolean
      {
         return var_1594;
      }
      
      public function set offsetX(param1:int) : void
      {
         _offset.x = param1;
         ++_updateID;
      }
      
      public function set offsetY(param1:int) : void
      {
         _offset.y = param1;
         ++_updateID;
      }
      
      public function get uid() : int
      {
         return _instanceId;
      }
      
      public function get relativeDepth() : Number
      {
         return var_932;
      }
      
      public function get color() : int
      {
         return _color;
      }
      
      public function get alpha() : int
      {
         return var_1595;
      }
      
      public function set capturesMouse(param1:Boolean) : void
      {
         var_1593 = param1;
         ++_updateID;
      }
      
      public function get visible() : Boolean
      {
         return var_326;
      }
      
      public function set varyingDepth(param1:Boolean) : void
      {
         var_1594 = param1;
         ++_updateID;
      }
      
      public function get flipH() : Boolean
      {
         return var_919;
      }
      
      public function get flipV() : Boolean
      {
         return var_918;
      }
      
      public function get clickHandling() : Boolean
      {
         return var_1591;
      }
      
      public function get blendMode() : String
      {
         return var_1590;
      }
      
      public function get tag() : String
      {
         return var_1592;
      }
      
      public function get assetName() : String
      {
         return var_1129;
      }
      
      public function set relativeDepth(param1:Number) : void
      {
         var_932 = param1;
         ++_updateID;
      }
      
      public function get capturesMouse() : Boolean
      {
         return var_1593;
      }
      
      public function set alpha(param1:int) : void
      {
         param1 &= 255;
         var_1595 = param1;
         ++_updateID;
      }
      
      public function get width() : int
      {
         return _width;
      }
      
      public function get updateId() : int
      {
         return _updateID;
      }
      
      public function set color(param1:int) : void
      {
         param1 &= 16777215;
         _color = param1;
         ++_updateID;
      }
      
      public function set asset(param1:BitmapData) : void
      {
         if(param1 != null)
         {
            _width = param1.width;
            _height = param1.height;
         }
         var_726 = param1;
         ++_updateID;
      }
      
      public function set visible(param1:Boolean) : void
      {
         var_326 = param1;
         ++_updateID;
      }
      
      public function get asset() : BitmapData
      {
         return var_726;
      }
      
      public function set flipH(param1:Boolean) : void
      {
         var_919 = param1;
         ++_updateID;
      }
   }
}
