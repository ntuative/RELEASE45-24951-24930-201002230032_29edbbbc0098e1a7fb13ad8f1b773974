package com.sulake.habbo.toolbar
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IRegionWindow;
   import com.sulake.core.window.enum.WindowType;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import com.sulake.habbo.window.enum.HabboWindowStyle;
   import com.sulake.habbo.window.enum.HabboWindowType;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.Timer;
   
   public class ToolbarIcon
   {
       
      
      private var var_477:ToolbarIconGroup;
      
      private var var_1001:Boolean = false;
      
      private var var_1969:String;
      
      private var var_722:Number;
      
      private var _assetLibrary:IAssetLibrary;
      
      private var var_998:String = "-1";
      
      private var _window:IBitmapWrapperWindow;
      
      private var var_31:String = "-1";
      
      private var var_90:IRegionWindow;
      
      private var _bitmapData:BitmapData;
      
      private var var_669:String;
      
      private var var_1970:int;
      
      private var var_670:Timer;
      
      private var var_1460:Array;
      
      private var var_999:ToolbarIconBouncer;
      
      private var _windowManager:IHabboWindowManager;
      
      private var _events:IEventDispatcher;
      
      private var var_2288:Array;
      
      private var var_254:ToolbarBarMenuAnimator;
      
      private var var_388:ToolbarIconAnimator;
      
      private var var_556:Array;
      
      private var var_831:Array;
      
      private var var_830:String = "-1";
      
      private var var_2352:Boolean = true;
      
      private var var_1000:Array;
      
      private var var_1219:Timer;
      
      private var var_1968:int;
      
      private var var_74:Number = 0;
      
      private var _y:Number = 0;
      
      public function ToolbarIcon(param1:ToolbarIconGroup, param2:IHabboWindowManager, param3:IAssetLibrary, param4:String, param5:IEventDispatcher, param6:ToolbarBarMenuAnimator)
      {
         var_556 = new Array();
         var_831 = new Array();
         var_2288 = new Array();
         var_999 = new ToolbarIconBouncer(0.8,1);
         super();
         var_477 = param1;
         _windowManager = param2;
         _assetLibrary = param3;
         var_669 = param4;
         _events = param5;
         var_254 = param6;
         var_1219 = new Timer(40,40);
         var_1219.addEventListener(TimerEvent.TIMER,updateBouncer);
         var_90 = param2.createWindow("TOOLBAR_ICON_" + param4 + "_REGION","",WindowType.const_334,HabboWindowStyle.const_23,HabboWindowParam.const_22,new Rectangle(0,0,1,1),onMouseEvent) as IRegionWindow;
         var_90.background = true;
         var_90.alphaTreshold = 0;
         var_90.visible = false;
         _window = IBitmapWrapperWindow(param2.createWindow("TOOLBAR_ICON_" + param4,"",HabboWindowType.BITMAP_WRAPPER,HabboWindowStyle.const_23,HabboWindowParam.const_23,new Rectangle(0,0,1,1),onMouseEvent,0));
         var_90.addChild(_window);
         _window.addEventListener(WindowEvent.const_26,onWindowResized);
      }
      
      private function getStateObject(param1:String) : StateItem
      {
         return var_1460[var_1000.indexOf(param1)];
      }
      
      public function get windowOffsetFromIcon() : Number
      {
         return var_1968;
      }
      
      public function get iconId() : String
      {
         return var_669;
      }
      
      private function onWindowResized(param1:WindowEvent) : void
      {
         updateRegion();
      }
      
      public function changePosition(param1:Number) : void
      {
         var_722 = param1;
         updateRegion();
      }
      
      public function setIcon(param1:Boolean = true) : void
      {
         exists = param1;
         setAnimator();
      }
      
      public function set state(param1:String) : void
      {
         var_31 = param1;
         exists = true;
         setAnimator();
         setTooltip();
      }
      
      private function updateRegion() : void
      {
         if(var_90 == null || _window == null)
         {
            return;
         }
         var_90.width = _window.width;
         var_90.height = _window.height;
         var _loc1_:Boolean = false;
         if(_loc1_)
         {
            var_74 = (0 - 0) / 2;
            _y = var_722 + (0 - 0) / 2;
         }
         else
         {
            var_74 = var_722 + (0 - 0) / 2;
            _y = (0 - 0) / 2;
         }
         var_90.x = var_74;
         var_90.y = _y;
      }
      
      public function dispose() : void
      {
         if(_window != null)
         {
            _window.dispose();
            _window = null;
         }
         if(var_90 != null)
         {
            var_90.dispose();
            var_90 = null;
         }
         var_556 = null;
         var_831 = null;
         exists = false;
         _windowManager = null;
         _events = null;
         var_254 = null;
         var_388 = null;
         _bitmapData = null;
      }
      
      public function dockMenu(param1:String, param2:Array = null, param3:Boolean = false) : void
      {
         var _loc4_:* = null;
         if(var_556.indexOf(param1) < 0)
         {
            var_556.push(param1);
            _loc4_ = new MenuSettingsItem(param1,param2,param3);
            var_831.push(_loc4_);
         }
      }
      
      private function onMouseEvent(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc4_:* = null;
         if(!var_1001)
         {
            return;
         }
         var _loc3_:StateItem = getCurrentStateObject();
         switch(param1.type)
         {
            case WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK:
               if(var_254)
               {
                  var_254.repositionWindow(var_669,true);
               }
               if(_events != null)
               {
                  _loc4_ = new HabboToolbarEvent(HabboToolbarEvent.const_46);
                  _loc4_.iconId = var_669;
                  _events.dispatchEvent(_loc4_);
               }
               break;
            case WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER:
               if(false)
               {
                  if(_loc3_.hasStateOver)
                  {
                     state = _loc3_.stateOver;
                  }
                  else
                  {
                     state = var_998;
                  }
               }
               break;
            case WindowMouseEvent.const_11:
               if(false)
               {
                  if(_loc3_.hasDefaultState)
                  {
                     state = _loc3_.defaultState;
                  }
                  else
                  {
                     state = var_830;
                  }
               }
         }
      }
      
      public function docksMenu(param1:String) : Boolean
      {
         return var_556.indexOf(param1) > -1;
      }
      
      public function menuLockedToIcon(param1:String) : Boolean
      {
         if(!docksMenu(param1))
         {
            return false;
         }
         var _loc2_:MenuSettingsItem = var_831[var_556.indexOf(param1)];
         return _loc2_.lockToIcon;
      }
      
      public function set exists(param1:Boolean) : void
      {
         var_1001 = param1;
         if(var_90 != null)
         {
            var_90.visible = var_1001;
         }
      }
      
      private function setTooltip() : void
      {
         if(var_90 == null)
         {
            return;
         }
         var _loc1_:StateItem = getCurrentStateObject();
         if(_loc1_ != null && _loc1_.tooltip != null)
         {
            var_90.toolTipCaption = "${toolbar.icon.tooltip." + _loc1_.tooltip + "}";
         }
         else
         {
            var_90.toolTipCaption = "${toolbar.icon.tooltip." + var_1969.toLowerCase() + "}";
         }
         var_90.toolTipDelay = 100;
      }
      
      public function animateWindowIn(param1:String, param2:IWindowContainer, param3:Number, param4:String, param5:Point) : void
      {
         if(var_254 != null)
         {
            var_254.animateWindowIn(this,param1,param2,var_669,param3,param4,getMenuYieldList(param1));
         }
      }
      
      private function updateAnimator(param1:Event) : void
      {
         if(var_388 != null && _window != null)
         {
            var_388.update(_window);
            if(var_388.hasNextState())
            {
               state = var_388.nextState;
            }
         }
      }
      
      public function defineFromXML(param1:XML) : void
      {
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var_1460 = new Array();
         var_1000 = new Array();
         var_1969 = param1.@id;
         var_1968 = int(param1.@window_offset_from_icon);
         var_1970 = int(param1.@window_margin);
         var _loc2_:XMLList = param1.elements("state");
         if(_loc2_.length() > 0)
         {
            if(param1.attribute("state_over").length() > 0)
            {
               var_998 = param1.@state_over;
            }
            if(param1.attribute("state_default").length() > 0)
            {
               var_830 = param1.@state_default;
            }
            _loc3_ = 0;
            while(_loc3_ < _loc2_.length())
            {
               _loc4_ = _loc2_[_loc3_];
               _loc5_ = new StateItem(_loc4_,param1.@id.toLowerCase());
               var_1000.push(_loc5_.id);
               var_1460.push(_loc5_);
               if(_loc3_ == 0)
               {
                  if(var_998 == "-1")
                  {
                     var_998 = _loc5_.id;
                  }
                  if(var_830 == "-1")
                  {
                     var_830 = _loc5_.id;
                  }
               }
               _loc3_++;
            }
         }
         var_31 = var_830;
      }
      
      public function setIconBitmapData(param1:BitmapData = null) : void
      {
         exists = true;
         _bitmapData = param1;
         setAnimator();
      }
      
      public function hideWindow(param1:String, param2:IWindowContainer, param3:Number, param4:String) : void
      {
         if(var_254 != null)
         {
            var_254.hideWindow(param1,param2,var_669,param3);
         }
      }
      
      public function positionWindow(param1:String, param2:IWindowContainer, param3:Number, param4:String) : void
      {
         if(var_254 != null)
         {
            var_254.positionWindow(this,param1,param2,var_669,param3,getMenuYieldList(param1));
         }
      }
      
      public function animateWindowOut(param1:String, param2:IWindowContainer, param3:String) : void
      {
         if(var_254 != null)
         {
            var_254.animateWindowOut(this,param1,param2,param3);
         }
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function get exists() : Boolean
      {
         return var_1001;
      }
      
      private function updateBouncer(param1:Event) : void
      {
         if(var_999 != null && _window != null)
         {
            var_999.update();
            _window.y = var_999.location;
         }
      }
      
      private function setAnimator() : void
      {
         if(var_670 != null)
         {
            var_670.stop();
            var_670 = null;
         }
         var _loc1_:StateItem = getCurrentStateObject();
         if(_loc1_ != null && var_1001)
         {
            if(_loc1_.frames == null)
            {
               return;
            }
            var_388 = new ToolbarIconAnimator(_loc1_,_assetLibrary,_window,var_74,_y,_bitmapData);
            if(false)
            {
               var_670 = new Timer(_loc1_.timer);
               var_670.addEventListener(TimerEvent.TIMER,updateAnimator);
               var_670.start();
            }
            if(_loc1_.bounce)
            {
               var_999.reset(-7);
               var_1219.reset();
               var_1219.start();
            }
         }
         else
         {
            var_388 = null;
            _window.bitmap = null;
         }
      }
      
      public function get windowMargin() : Number
      {
         return var_1970 + var_477.windowMargin;
      }
      
      private function getCurrentStateObject() : StateItem
      {
         return getStateObject(var_31);
      }
      
      public function get window() : IWindow
      {
         return var_90;
      }
      
      public function get x() : Number
      {
         return var_74;
      }
      
      private function getMenuYieldList(param1:String) : Array
      {
         if(!docksMenu(param1))
         {
            return null;
         }
         var _loc2_:MenuSettingsItem = var_831[var_556.indexOf(param1)];
         return _loc2_.yieldList;
      }
      
      public function get group() : ToolbarIconGroup
      {
         return var_477;
      }
   }
}
