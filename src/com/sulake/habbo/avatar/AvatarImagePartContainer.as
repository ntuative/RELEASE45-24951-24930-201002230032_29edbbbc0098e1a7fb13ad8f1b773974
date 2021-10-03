package com.sulake.habbo.avatar
{
   import com.sulake.habbo.avatar.actions.IActionDefinition;
   import com.sulake.habbo.avatar.structure.figure.IPartColor;
   import flash.geom.ColorTransform;
   
   public class AvatarImagePartContainer
   {
       
      
      private var _frames:Array;
      
      private var var_1601:int;
      
      private var var_1602:String;
      
      private var var_1539:IActionDefinition;
      
      private var var_1600:Boolean;
      
      private var _color:IPartColor;
      
      private var var_1604:String;
      
      private var var_1603:String;
      
      private var var_1606:Boolean;
      
      private var var_1607:ColorTransform;
      
      private var var_1605:int;
      
      public function AvatarImagePartContainer(param1:String, param2:String, param3:int, param4:IPartColor, param5:Array, param6:IActionDefinition, param7:Boolean, param8:int, param9:String = "", param10:Boolean = false, param11:Number = 1)
      {
         super();
         var_1602 = param1;
         var_1604 = param2;
         var_1601 = param3;
         _color = param4;
         _frames = param5;
         var_1539 = param6;
         var_1606 = param7;
         var_1605 = param8;
         var_1603 = param9;
         var_1600 = param10;
         var_1607 = new ColorTransform(1,1,1,param11);
      }
      
      public function get isColorable() : Boolean
      {
         return var_1606;
      }
      
      public function get partType() : String
      {
         return var_1604;
      }
      
      public function getFrameIndex(param1:int) : int
      {
         return 0;
      }
      
      public function get paletteMapId() : int
      {
         return var_1605;
      }
      
      public function get isBlendable() : Boolean
      {
         return var_1600;
      }
      
      public function get color() : IPartColor
      {
         return _color;
      }
      
      public function get partId() : int
      {
         return var_1601;
      }
      
      public function get flippedPartType() : String
      {
         return var_1603;
      }
      
      public function get bodyPartId() : String
      {
         return var_1602;
      }
      
      public function get action() : IActionDefinition
      {
         return var_1539;
      }
      
      public function get blendTransform() : ColorTransform
      {
         return var_1607;
      }
   }
}
