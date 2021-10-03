package com.sulake.habbo.inventory.effects
{
   import com.sulake.habbo.inventory.common.IThumbListDrawableItem;
   import com.sulake.habbo.widget.memenu.IWidgetAvatarEffect;
   import flash.display.BitmapData;
   
   public class Effect implements IWidgetAvatarEffect, IThumbListDrawableItem
   {
       
      
      private var _isSelected:Boolean = false;
      
      private var var_1735:Date;
      
      private var var_1120:Boolean = false;
      
      private var _type:int;
      
      private var var_347:BitmapData;
      
      private var var_266:Boolean = false;
      
      private var var_1165:int;
      
      private var var_519:int = 1;
      
      private var var_931:int;
      
      public function Effect()
      {
         super();
      }
      
      public function get icon() : BitmapData
      {
         return var_347;
      }
      
      public function set type(param1:int) : void
      {
         _type = param1;
      }
      
      public function setOneEffectExpired() : void
      {
         --var_519;
         if(var_519 < 0)
         {
            var_519 = 0;
         }
         var_931 = var_1165;
         var_266 = false;
         var_1120 = false;
      }
      
      public function set isSelected(param1:Boolean) : void
      {
         _isSelected = param1;
      }
      
      public function set secondsLeft(param1:int) : void
      {
         var_931 = param1;
      }
      
      public function get isActive() : Boolean
      {
         return var_266;
      }
      
      public function set iconImage(param1:BitmapData) : void
      {
         var_347 = param1;
      }
      
      public function get duration() : int
      {
         return var_1165;
      }
      
      public function get isInUse() : Boolean
      {
         return var_1120;
      }
      
      public function get effectsInInventory() : int
      {
         return var_519;
      }
      
      public function get iconImage() : BitmapData
      {
         return var_347;
      }
      
      public function get isSelected() : Boolean
      {
         return _isSelected;
      }
      
      public function set isActive(param1:Boolean) : void
      {
         if(param1 && !var_266)
         {
            var_1735 = new Date();
         }
         var_266 = param1;
      }
      
      public function set effectsInInventory(param1:int) : void
      {
         var_519 = param1;
      }
      
      public function get secondsLeft() : int
      {
         var _loc1_:int = 0;
         if(var_266)
         {
            _loc1_ = var_931 - (new Date().valueOf() - var_1735.valueOf()) / 1000;
            _loc1_ = Math.floor(_loc1_);
            if(_loc1_ < 0)
            {
               _loc1_ = 0;
            }
            return _loc1_;
         }
         return var_931;
      }
      
      public function set isInUse(param1:Boolean) : void
      {
         var_1120 = param1;
      }
      
      public function set duration(param1:int) : void
      {
         var_1165 = param1;
      }
      
      public function get type() : int
      {
         return _type;
      }
   }
}
