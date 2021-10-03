package com.sulake.habbo.avatar
{
   import flash.display.BitmapData;
   import flash.geom.Point;
   
   public class AvatarImageBodyPartContainer
   {
       
      
      private var _image:BitmapData;
      
      private var _offset:Point;
      
      private var var_531:Point;
      
      public function AvatarImageBodyPartContainer(param1:BitmapData, param2:Point)
      {
         _offset = new Point(0,0);
         super();
         _image = param1;
         var_531 = param2;
         cleanPoints();
      }
      
      public function getImage() : BitmapData
      {
         return _image;
      }
      
      public function set offset(param1:Point) : void
      {
         _offset = param1;
         cleanPoints();
      }
      
      private function cleanPoints() : void
      {
         var_531.x = int(var_531.x);
         var_531.y = int(var_531.y);
         _offset.x = int(_offset.x);
         _offset.y = int(_offset.y);
      }
      
      public function setImage(param1:BitmapData) : void
      {
         _image = param1;
      }
      
      public function get regPoint() : Point
      {
         return var_531.add(_offset);
      }
      
      public function setRegPoint(param1:Point) : void
      {
         var_531 = param1;
         cleanPoints();
      }
   }
}
