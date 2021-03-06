package com.sulake.room.object.visualization
{
   import flash.display.BitmapData;
   
   public interface IRoomObjectSprite
   {
       
      
      function get updateId() : int;
      
      function set color(param1:int) : void;
      
      function get flipV() : Boolean;
      
      function set offsetX(param1:int) : void;
      
      function set offsetY(param1:int) : void;
      
      function get width() : int;
      
      function get uid() : int;
      
      function set flipV(param1:Boolean) : void;
      
      function get blendMode() : String;
      
      function get relativeDepth() : Number;
      
      function get tag() : String;
      
      function get assetName() : String;
      
      function get clickHandling() : Boolean;
      
      function get alpha() : int;
      
      function set asset(param1:BitmapData) : void;
      
      function set clickHandling(param1:Boolean) : void;
      
      function get color() : int;
      
      function set visible(param1:Boolean) : void;
      
      function get offsetX() : int;
      
      function get offsetY() : int;
      
      function get height() : int;
      
      function set blendMode(param1:String) : void;
      
      function set varyingDepth(param1:Boolean) : void;
      
      function set relativeDepth(param1:Number) : void;
      
      function get asset() : BitmapData;
      
      function get visible() : Boolean;
      
      function get varyingDepth() : Boolean;
      
      function set tag(param1:String) : void;
      
      function set assetName(param1:String) : void;
      
      function set capturesMouse(param1:Boolean) : void;
      
      function get capturesMouse() : Boolean;
      
      function get flipH() : Boolean;
      
      function set alpha(param1:int) : void;
      
      function set flipH(param1:Boolean) : void;
   }
}
