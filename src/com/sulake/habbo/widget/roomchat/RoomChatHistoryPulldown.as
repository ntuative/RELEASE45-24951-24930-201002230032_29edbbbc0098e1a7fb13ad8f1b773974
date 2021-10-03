package com.sulake.habbo.widget.roomchat
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IRegionWindow;
   import com.sulake.core.window.enum.WindowType;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import com.sulake.habbo.window.enum.HabboWindowStyle;
   import com.sulake.habbo.window.enum.HabboWindowType;
   import flash.display.BitmapData;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class RoomChatHistoryPulldown
   {
      
      public static const const_356:int = 2;
      
      public static const const_299:int = 1;
      
      public static const const_187:int = 0;
      
      public static const const_759:int = 3;
      
      private static const const_743:int = 150;
      
      private static const const_742:int = 250;
      
      public static const const_55:int = 39;
       
      
      private var var_1454:BitmapData;
      
      private var _assetLibrary:IAssetLibrary;
      
      private var var_1453:BitmapData;
      
      private var _window:IWindowContainer;
      
      private var var_1944:int = 0;
      
      private var var_27:IWindowContainer;
      
      private var var_90:IRegionWindow;
      
      private var var_1945:int = 30;
      
      private var var_31:int = -1;
      
      private var var_1943:BitmapData;
      
      private var _widget:RoomChatWidget;
      
      private var _windowManager:IHabboWindowManager;
      
      private var var_1942:BitmapData;
      
      private var var_65:IBitmapWrapperWindow;
      
      private var var_1947:BitmapData;
      
      private var var_1946:BitmapData;
      
      private var var_1452:BitmapData;
      
      public function RoomChatHistoryPulldown(param1:RoomChatWidget, param2:IHabboWindowManager, param3:IWindowContainer, param4:IAssetLibrary)
      {
         super();
         _widget = param1;
         _windowManager = param2;
         _assetLibrary = param4;
         var_27 = param3;
         var_1946 = (_assetLibrary.getAssetByName("chat_grapbar_bg") as BitmapDataAsset).content as BitmapData;
         var_1453 = (_assetLibrary.getAssetByName("chat_grapbar_grip") as BitmapDataAsset).content as BitmapData;
         var_1947 = (_assetLibrary.getAssetByName("chat_grapbar_handle") as BitmapDataAsset).content as BitmapData;
         var_1452 = (_assetLibrary.getAssetByName("chat_grapbar_x") as BitmapDataAsset).content as BitmapData;
         var_1454 = (_assetLibrary.getAssetByName("chat_grapbar_x_hi") as BitmapDataAsset).content as BitmapData;
         var_1943 = (_assetLibrary.getAssetByName("chat_grapbar_x_pr") as BitmapDataAsset).content as BitmapData;
         var_1942 = (_assetLibrary.getAssetByName("chat_history_bg") as BitmapDataAsset).content as BitmapData;
         var_65 = _windowManager.createWindow("chat_history_bg","",HabboWindowType.BITMAP_WRAPPER,HabboWindowStyle.const_20,HabboWindowParam.const_49,new Rectangle(0,0,param3.width,param3.height - const_55),null,0,0) as IBitmapWrapperWindow;
         var_27.addChild(var_65);
         _window = _windowManager.createWindow("chat_pulldown","",HabboWindowType.const_37,HabboWindowStyle.const_20,HabboWindowParam.const_22,new Rectangle(0,0 - const_55,param3.width,const_55),null,0) as IWindowContainer;
         var_27.addChild(_window);
         var_90 = _windowManager.createWindow("REGIONchat_pulldown","",WindowType.const_334,HabboWindowStyle.const_23,0 | 0 | 0 | 0,new Rectangle(0,0,param3.width,param3.height - const_55),null,0) as IRegionWindow;
         if(var_90 != null)
         {
            var_90.background = true;
            var_90.alphaTreshold = 0;
            var_90.addEventListener(WindowMouseEvent.const_34,onPulldownMouseDown);
            var_27.addChild(var_90);
            var_90.toolTipCaption = "${chat.history.drag.tooltip}";
            var_90.toolTipDelay = 250;
         }
         var _loc5_:XmlAsset = param4.getAssetByName("chat_history_pulldown") as XmlAsset;
         _window.buildFromXML(_loc5_.content as XML);
         _window.addEventListener(WindowMouseEvent.const_34,onPulldownMouseDown);
         var _loc6_:IBitmapWrapperWindow = _window.findChildByName("GrapBarX") as IBitmapWrapperWindow;
         if(_loc6_ != null)
         {
            _loc6_.alphaTreshold = 0;
            _loc6_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,onCloseButtonClicked);
            _loc6_.addEventListener(WindowMouseEvent.const_78,onCloseButtonMouseUp);
            _loc6_.addEventListener(WindowMouseEvent.const_34,onCloseButtonMouseDown);
            _loc6_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER,onCloseButtonMouseOver);
            _loc6_.addEventListener(WindowMouseEvent.const_11,onCloseButtonMouseOut);
         }
         _window.background = true;
         _window.color = 0;
         _window.alphaTreshold = 0;
         this.state = const_187;
         buildWindowGraphics();
      }
      
      private function onCloseButtonMouseDown(param1:WindowMouseEvent) : void
      {
         if(_window == null)
         {
            return;
         }
         if(true)
         {
            return;
         }
         var _loc2_:IBitmapWrapperWindow = _window.findChildByName("GrapBarX") as IBitmapWrapperWindow;
         if(_loc2_ != null)
         {
            _loc2_.bitmap = var_1943.clone();
         }
      }
      
      private function onCloseButtonMouseUp(param1:WindowMouseEvent) : void
      {
         if(_window == null)
         {
            return;
         }
         if(true)
         {
            return;
         }
         var _loc2_:IBitmapWrapperWindow = _window.findChildByName("GrapBarX") as IBitmapWrapperWindow;
         if(_loc2_ != null)
         {
            _loc2_.bitmap = var_1454.clone();
         }
      }
      
      public function update(param1:uint) : void
      {
         switch(state)
         {
            case const_356:
               var_65.blend += param1 / const_742;
               _window.blend += param1 / const_742;
               if(false)
               {
                  state = const_299;
               }
               break;
            case const_759:
               var_65.blend = 0 - param1 / const_743;
               _window.blend = 0 - param1 / const_743;
               if(true)
               {
                  state = const_187;
               }
         }
      }
      
      private function onCloseButtonClicked(param1:WindowMouseEvent) : void
      {
         if(_widget != null)
         {
            _widget.onPulldownCloseButtonClicked(param1);
         }
      }
      
      public function get state() : int
      {
         return var_31;
      }
      
      private function onCloseButtonMouseOver(param1:WindowMouseEvent) : void
      {
         if(_window == null)
         {
            return;
         }
         if(true)
         {
            return;
         }
         var _loc2_:IBitmapWrapperWindow = _window.findChildByName("GrapBarX") as IBitmapWrapperWindow;
         if(_loc2_ != null)
         {
            _loc2_.bitmap = var_1454.clone();
         }
      }
      
      public function dispose() : void
      {
         if(var_90 != null)
         {
            var_90.dispose();
            var_90 = null;
         }
         if(_window != null)
         {
            _window.dispose();
            _window = null;
         }
         if(var_65 != null)
         {
            var_65.dispose();
            var_65 = null;
         }
      }
      
      private function onPulldownMouseDown(param1:WindowMouseEvent) : void
      {
         if(_widget != null)
         {
            _widget.onPulldownMouseDown(param1);
         }
      }
      
      public function set state(param1:int) : void
      {
         if(param1 == var_31)
         {
            return;
         }
         switch(param1)
         {
            case const_299:
               if(var_31 == const_187)
               {
                  this.state = const_356;
               }
               else
               {
                  if(_window == null || var_65 == null)
                  {
                     return;
                  }
                  _window.visible = true;
                  var_65.visible = true;
                  var_90.visible = true;
                  var_31 = param1;
               }
               break;
            case const_187:
               if(_window == null || var_65 == null)
               {
                  return;
               }
               _window.visible = false;
               var_65.visible = false;
               var_90.visible = false;
               var_31 = param1;
               break;
            case const_356:
               if(_window == null || var_65 == null)
               {
                  return;
               }
               _window.blend = 0;
               var_65.blend = 0;
               _window.visible = true;
               var_65.visible = true;
               var_31 = param1;
               break;
            case const_759:
               if(_window == null || var_65 == null)
               {
                  return;
               }
               _window.blend = 1;
               var_65.blend = 1;
               var_31 = param1;
               break;
         }
      }
      
      private function tileBitmapHorz(param1:BitmapData, param2:BitmapData) : void
      {
         var _loc3_:int = param2.width / param1.width;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_ + 1)
         {
            param2.copyPixels(param1,param1.rect,new Point(_loc4_ * param1.width,0));
            _loc4_++;
         }
      }
      
      public function containerResized(param1:Rectangle) : void
      {
         if(_window != null)
         {
            _window.x = 0;
            _window.y = 0 - const_55;
            _window.width = var_27.width;
         }
         if(var_90 != null)
         {
            var_90.x = 0;
            var_90.y = 0 - const_55;
            var_90.width = 0 - var_1945;
         }
         if(var_65 != null)
         {
            var_65.rectangle = var_27.rectangle;
            var_65.height = 0 - const_55;
         }
         buildWindowGraphics();
      }
      
      private function onCloseButtonMouseOut(param1:WindowMouseEvent) : void
      {
         if(_window == null)
         {
            return;
         }
         if(true)
         {
            return;
         }
         var _loc2_:IBitmapWrapperWindow = _window.findChildByName("GrapBarX") as IBitmapWrapperWindow;
         if(_loc2_ != null)
         {
            _loc2_.bitmap = var_1452.clone();
         }
      }
      
      private function buildWindowGraphics() : void
      {
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         if(_window == null)
         {
            return;
         }
         if(var_1944 == _window.width)
         {
            return;
         }
         var_1944 = _window.width;
         var _loc1_:IBitmapWrapperWindow = _window.findChildByName("grapBarBg") as IBitmapWrapperWindow;
         var _loc2_:IBitmapWrapperWindow = _window.findChildByName("GrapBarX") as IBitmapWrapperWindow;
         var _loc3_:IBitmapWrapperWindow = _window.findChildByName("grapBarGripL") as IBitmapWrapperWindow;
         var _loc4_:IBitmapWrapperWindow = _window.findChildByName("grapBarGripR") as IBitmapWrapperWindow;
         var _loc5_:IBitmapWrapperWindow = _window.findChildByName("grapBarHandle") as IBitmapWrapperWindow;
         if(_loc2_ != null && _loc5_ != null)
         {
            _loc5_.bitmap = var_1947.clone();
            _loc2_.bitmap = var_1452.clone();
            var_1945 = 0 - _loc2_.x;
         }
         _loc3_.width = _loc5_.x - 5;
         _loc3_.x = 0;
         _loc4_.x = _loc5_.x + _loc5_.width + 5;
         _loc4_.width = _loc2_.x - 5 - _loc4_.x;
         if(_loc3_.width < 0)
         {
            _loc3_.width = 0;
         }
         if(_loc4_.width < 0)
         {
            _loc4_.width = 0;
         }
         if(_loc1_ != null && _loc3_ != null && _loc4_ != null)
         {
            if(_loc1_.width > 0 && _loc1_.height > 0)
            {
               _loc7_ = new BitmapData(_loc1_.width,_loc1_.height);
               tileBitmapHorz(var_1946.clone(),_loc7_);
               _loc1_.bitmap = _loc7_;
            }
            if(_loc3_.width > 0 && _loc3_.height > 0)
            {
               _loc8_ = new BitmapData(_loc3_.width,_loc3_.height);
               tileBitmapHorz(var_1453.clone(),_loc8_);
               _loc3_.bitmap = _loc8_;
            }
            if(_loc4_.width > 0 && _loc4_.height > 0)
            {
               _loc9_ = new BitmapData(_loc4_.width,_loc4_.height);
               tileBitmapHorz(var_1453.clone(),_loc9_);
               _loc4_.bitmap = _loc9_;
            }
         }
         if(var_65 == null)
         {
            return;
         }
         var_65.bitmap = var_1942.clone();
      }
   }
}
