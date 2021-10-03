package com.sulake.core.window
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.runtime.events.EventDispatcher;
   import com.sulake.core.utils.Map;
   import com.sulake.core.window.components.IDesktopWindow;
   import com.sulake.core.window.enum.MouseListenerType;
   import com.sulake.core.window.enum.WindowParam;
   import com.sulake.core.window.enum.WindowState;
   import com.sulake.core.window.events.WindowDisposeEvent;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowKeyboardEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.core.window.events.WindowNotifyEvent;
   import com.sulake.core.window.graphics.GraphicContext;
   import com.sulake.core.window.graphics.IGraphicContext;
   import com.sulake.core.window.graphics.IGraphicContextHost;
   import com.sulake.core.window.graphics.WindowRedrawFlag;
   import com.sulake.core.window.utils.WindowRectLimits;
   import flash.display.BitmapData;
   import flash.display.IBitmapDrawable;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.getDefinitionByName;
   import flash.utils.getQualifiedClassName;
   
   public class WindowController extends WindowModel implements IWindow, IGraphicContextHost
   {
      
      private static var var_1472:Point = new Point();
      
      protected static const EXCLUDE_CHILD_TAG:String = "_EXCLUDE";
      
      protected static const INTERNAL_CHILD_TAG:String = "_INTERNAL";
      
      private static var var_1230:uint = 0;
       
      
      protected var var_149:Boolean = true;
      
      private var var_1002:Boolean = false;
      
      protected var _events:IEventDispatcher;
      
      private var var_290:Rectangle;
      
      protected var var_590:Function;
      
      protected var _children:Array;
      
      protected var var_1329:Boolean = false;
      
      private var var_1990:uint;
      
      protected var var_6:WindowController;
      
      protected var var_713:uint = 10;
      
      protected var var_14:IGraphicContext;
      
      public function WindowController(param1:String, param2:uint, param3:uint, param4:uint, param5:WindowContext, param6:Rectangle, param7:IWindow, param8:Function = null, param9:Array = null, param10:Array = null, param11:uint = 0)
      {
         var _loc13_:* = 0;
         var_1990 = var_1230++;
         var _loc12_:XML = param5.getWindowFactory().getLayoutByType(param2,param3);
         if(param6 == null)
         {
            param6 = new Rectangle(0,0,_loc12_ == null ? 10 : Number(int(_loc12_.attribute("width"))),_loc12_ == null ? 10 : Number(int(_loc12_.attribute("height"))));
         }
         super(param11,param1,param2,param3,param4,param5,param6,param10);
         if(!var_14)
         {
            var_14 = getGraphicContext(!testParamFlag(WindowParam.const_15));
         }
         _events = new EventDispatcher(this);
         _children = new Array();
         var_290 = new Rectangle();
         if(_loc12_ != null)
         {
            var_346 = new Rectangle(0,0,int(_loc12_.attribute("width")),int(_loc12_.attribute("height")));
            var_47 = var_346.clone();
            var_5 = var_346.clone();
            param5.getWindowParser().parseAndConstruct(_loc12_,this,null);
            _loc13_ = uint(var_13);
            var_13 &= -1;
            setRectangle(param6.x,param6.y,param6.width,param6.height);
            var_13 = _loc13_;
            var_47.x = param6.x;
            var_47.y = param6.y;
            var_47.width = param6.width;
            var_47.height = param6.height;
         }
         if(param9)
         {
            this.properties = param9;
         }
         var_590 = param8;
         if(param7 != null)
         {
            var_6 = param7 as WindowController;
            WindowController(param7).addChild(this);
            if(var_14)
            {
               _context.invalidate(this,var_5,WindowRedrawFlag.const_52);
            }
         }
      }
      
      private static function calculateMouseRegion(param1:WindowController, param2:Rectangle) : void
      {
         var _loc3_:Rectangle = new Rectangle();
         param1.getGlobalRectangle(_loc3_);
         var _loc4_:int = param1.numChildren;
         var _loc5_:int = _loc3_.x;
         var _loc6_:int = _loc3_.y;
         param2.left = _loc5_ < param2.left ? Number(_loc5_) : Number(param2.left);
         param2.top = _loc6_ < param2.top ? Number(_loc6_) : Number(param2.top);
         param2.right = _loc3_.right > param2.right ? Number(_loc3_.right) : Number(param2.right);
         param2.bottom = _loc3_.bottom > param2.bottom ? Number(_loc3_.bottom) : Number(param2.bottom);
         var _loc7_:int = 0;
         while(_loc7_ < _loc4_)
         {
            WindowController.calculateMouseRegion(param1.getChildAt(_loc7_) as WindowController,param2);
            _loc7_++;
         }
      }
      
      public static function resizeToAccommodateChildren(param1:WindowController, param2:Boolean = true) : void
      {
         var _loc3_:int = 0;
         var _loc8_:* = null;
         var _loc12_:* = null;
         var _loc13_:Boolean = false;
         var _loc4_:int = !!param2 ? 0 : 0;
         var _loc5_:int = !!param2 ? 0 : 0;
         var _loc6_:int = !!param2 ? 0 : 0;
         var _loc7_:int = !!param2 ? 0 : 0;
         var _loc9_:Boolean = false;
         var _loc10_:uint = param1.numChildren;
         var _loc11_:Boolean = param1.getParamFlag(WindowParam.const_44);
         if(param2)
         {
            _loc3_ = 0;
            while(_loc3_ < _loc10_)
            {
               _loc8_ = param1.getChildAt(_loc3_).rectangle;
               if(_loc8_.x < _loc4_)
               {
                  _loc4_ = _loc8_.x;
                  _loc9_ = true;
               }
               if(_loc8_.right > _loc6_)
               {
                  _loc6_ = _loc8_.right;
                  _loc9_ = true;
               }
               if(_loc8_.y < _loc5_)
               {
                  _loc5_ = _loc8_.y;
                  _loc9_ = true;
               }
               if(_loc8_.bottom > _loc7_)
               {
                  _loc7_ = _loc8_.bottom;
                  _loc9_ = true;
               }
               _loc3_++;
            }
         }
         else
         {
            _loc3_ = 0;
            while(_loc3_ < _loc10_)
            {
               _loc8_ = param1.getChildAt(_loc3_).rectangle;
               if(_loc8_.x < _loc4_)
               {
                  _loc4_ = _loc8_.x;
                  _loc9_ = true;
               }
               if(_loc8_.right > _loc6_)
               {
                  _loc6_ = _loc8_.right;
                  _loc9_ = true;
               }
               if(_loc8_.y < _loc5_)
               {
                  _loc5_ = _loc8_.y;
                  _loc9_ = true;
               }
               if(_loc8_.bottom > _loc7_)
               {
                  _loc7_ = _loc8_.bottom;
                  _loc9_ = true;
               }
               _loc3_++;
            }
         }
         if(_loc9_)
         {
            if(_loc11_)
            {
               param1.setParamFlag(WindowParam.const_44,false);
            }
            if(param2)
            {
               _loc3_ = 0;
               while(_loc3_ < _loc10_)
               {
                  _loc12_ = param1.getChildAt(_loc3_);
                  _loc13_ = param1.testParamFlag(WindowParam.const_67);
                  if(_loc13_)
                  {
                     param1.setParamFlag(WindowParam.const_67,false);
                  }
                  param1.offset(-_loc4_,-_loc5_);
                  if(_loc13_)
                  {
                     param1.setParamFlag(WindowParam.const_67,true);
                  }
                  _loc3_++;
               }
            }
            else
            {
               _loc3_ = 0;
               while(_loc3_ < _loc10_)
               {
                  param1.getChildAt(_loc3_).offset(-_loc4_,-_loc5_);
                  _loc3_++;
               }
            }
            param1.setRectangle(param1.x + _loc4_,param1.y + _loc5_,!!param2 ? int(_loc6_ - _loc4_) : int(_loc6_),!!param2 ? int(_loc7_ - _loc5_) : int(_loc7_));
            if(_loc11_)
            {
               param1.setParamFlag(WindowParam.const_44,true);
            }
         }
      }
      
      public static function expandToAccommodateChild(param1:WindowController, param2:IWindow) : void
      {
         var _loc9_:Boolean = false;
         var _loc10_:int = 0;
         var _loc11_:* = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = param1.width;
         var _loc6_:int = param1.height;
         var _loc7_:Rectangle = param2.rectangle.clone();
         var _loc8_:Boolean = false;
         if(_loc7_.x < 0)
         {
            _loc3_ = _loc7_.x;
            _loc5_ -= _loc3_;
            _loc7_.x = 0;
            _loc8_ = true;
         }
         if(_loc7_.right > _loc5_)
         {
            _loc5_ = _loc7_.x + _loc7_.width;
            _loc8_ = true;
         }
         if(_loc7_.y < 0)
         {
            _loc4_ = _loc7_.y;
            _loc6_ -= _loc4_;
            _loc7_.y = 0;
            _loc8_ = true;
         }
         if(_loc7_.bottom > _loc6_)
         {
            _loc6_ = _loc7_.y + _loc7_.height;
            _loc8_ = true;
         }
         if(_loc8_)
         {
            _loc9_ = param1.getParamFlag(WindowParam.const_44);
            param1.setParamFlag(WindowParam.const_44,false);
            param1.setRectangle(param1.x + _loc3_,param1.y + _loc4_,_loc5_,_loc6_);
            if(_loc4_ != 0 || _loc3_ != 0)
            {
               _loc11_ = uint(param1.numChildren);
               _loc10_ = 0;
               while(_loc10_ < _loc11_)
               {
                  IWindow(param1.getChildAt(_loc10_)).offset(-_loc3_,-_loc4_);
                  _loc10_++;
               }
            }
            if(_loc9_)
            {
               param1.setParamFlag(WindowParam.const_44,true);
            }
         }
      }
      
      public function resolveHorizontalScale() : Number
      {
         return 0 / 0;
      }
      
      public function getStyleFlag(param1:uint) : Boolean
      {
         return (var_73 & param1) != 0;
      }
      
      public function getChildByTag(param1:String) : IWindow
      {
         var _loc2_:* = null;
         for each(_loc2_ in _children)
         {
            if(_loc2_.tags.indexOf(param1) > -1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      protected function updateScaleRelativeToParent() : void
      {
         var _loc3_:* = null;
         var _loc4_:int = 0;
         var _loc5_:* = 0;
         var _loc6_:* = 0;
         var _loc7_:* = null;
         if(var_6 == null)
         {
            return;
         }
         var _loc1_:* = !testParamFlag(WindowParam.const_105,WindowParam.const_123);
         var _loc2_:* = !testParamFlag(WindowParam.const_98,WindowParam.const_125);
         if(_loc1_ || _loc2_)
         {
            _loc3_ = var_5.clone();
            if(_loc1_)
            {
               _loc4_ = 0 - 0;
               _loc5_ = uint(var_13 & 0);
               if(_loc5_ == WindowParam.const_242)
               {
                  _loc3_.width += _loc4_;
               }
               else if(_loc5_ == WindowParam.const_291)
               {
                  _loc3_.x += _loc4_;
               }
               else if(_loc5_ == WindowParam.const_146)
               {
                  if(var_6.width < _loc3_.width && getParamFlag(WindowParam.const_15))
                  {
                     _loc3_.x = 0;
                  }
                  else
                  {
                     _loc3_.x = 0 - _loc3_.width / 2;
                  }
               }
            }
            if(_loc2_)
            {
               _loc4_ = 0 - 0;
               _loc5_ = uint(var_13 & 0);
               if(_loc5_ == WindowParam.const_228)
               {
                  _loc3_.height += _loc4_;
               }
               else if(_loc5_ == WindowParam.const_262)
               {
                  _loc3_.y += _loc4_;
               }
               else if(_loc5_ == WindowParam.const_141)
               {
                  if(var_6.height < _loc3_.height && getParamFlag(WindowParam.const_15))
                  {
                     _loc3_.y = 0;
                  }
                  else
                  {
                     _loc3_.y = 0 - _loc3_.height / 2;
                  }
               }
            }
            _loc6_ = uint(var_13);
            var_13 &= -1;
            setRectangle(_loc3_.x,_loc3_.y,_loc3_.width,_loc3_.height);
            var_13 = _loc6_;
         }
         else if(testParamFlag(WindowParam.const_67))
         {
            _loc3_ = var_5.clone();
            if(var_6 != null)
            {
               _loc7_ = var_6.rectangle;
               _loc3_.x = _loc3_.x < 0 ? 0 : Number(_loc3_.x);
               _loc3_.y = _loc3_.y < 0 ? 0 : Number(_loc3_.y);
               _loc3_.x -= _loc3_.x + _loc3_.width > _loc7_.width ? _loc3_.x + _loc3_.width - _loc7_.width : 0;
               _loc3_.y -= _loc3_.y + _loc3_.height > _loc7_.height ? _loc3_.y + _loc3_.height - _loc7_.height : 0;
               _loc3_.width -= _loc3_.x + _loc3_.width > _loc7_.width ? _loc3_.x + _loc3_.width - _loc7_.width : 0;
               _loc3_.height -= _loc3_.y + _loc3_.height > _loc7_.height ? _loc3_.y + _loc3_.height - _loc7_.height : 0;
               if(_loc3_.x != var_5.x || _loc3_.y != var_5.y || _loc3_.width != var_5.width || _loc3_.height != var_5.height)
               {
                  _loc6_ = uint(var_13);
                  var_13 &= -1;
                  setRectangle(_loc3_.x,_loc3_.y,_loc3_.width,_loc3_.height);
                  var_13 = _loc6_;
               }
            }
         }
      }
      
      public function get desktop() : IDesktopWindow
      {
         return _context.getDesktopWindow();
      }
      
      override public function dispose() : void
      {
         if(!_disposed)
         {
            if(true)
            {
               if(!isChildWindow())
               {
                  if(getStateFlag(WindowState.const_73))
                  {
                     deactivate();
                  }
               }
            }
            while(false)
            {
               IDisposable(_children.pop()).dispose();
            }
            if(parent)
            {
               parent = null;
            }
            dispatchEvent(new WindowDisposeEvent(this));
            if(_events is IDisposable)
            {
               IDisposable(_events).dispose();
               _events = null;
            }
            if(var_14 != null)
            {
               var_14.dispose();
               var_14 = null;
            }
            super.dispose();
         }
      }
      
      protected function forwardKeyboardEvent(param1:KeyboardEvent) : WindowEvent
      {
         var _loc2_:String = "null";
         switch(param1.type)
         {
            case KeyboardEvent.KEY_DOWN:
               _loc2_ = "null";
               break;
            case KeyboardEvent.KEY_UP:
               _loc2_ = "null";
         }
         var _loc4_:WindowEvent = new WindowKeyboardEvent(_loc2_,param1,this,null,false,true);
         procedure(_loc4_,this);
         if(!_loc4_.isWindowOperationPrevented())
         {
            dispatchEvent(_loc4_);
         }
         return _loc4_;
      }
      
      public function set tags(param1:Array) : void
      {
         if(param1 != null)
         {
            var_589 = param1;
         }
      }
      
      public function getChildAt(param1:int) : IWindow
      {
         return _children[param1] as IWindow;
      }
      
      public function set id(param1:uint) : void
      {
         _id = param1;
      }
      
      public function getChildByID(param1:uint) : IWindow
      {
         var _loc2_:* = null;
         for each(_loc2_ in _children)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function findChildByName(param1:String) : IWindow
      {
         var _loc2_:* = null;
         for each(_loc2_ in _children)
         {
            if(_loc2_.name == param1)
            {
               return _loc2_;
            }
         }
         for each(_loc2_ in _children)
         {
            _loc2_ = _loc2_.findChildByName(param1) as WindowController;
            if(_loc2_)
            {
               return _loc2_ as IWindow;
            }
         }
         return null;
      }
      
      public function dispatchEvent(param1:Event) : Boolean
      {
         var _loc2_:Boolean = false;
         if(!_disposed)
         {
            _loc2_ = _events.dispatchEvent(param1);
         }
         return _loc2_;
      }
      
      public function setGlobalRectangle(param1:Rectangle) : void
      {
         var _loc2_:Point = new Point();
         if(var_6 != null)
         {
            var_6.getGlobalPosition(_loc2_);
            _loc2_.x += var_5.x;
            _loc2_.y += var_5.y;
         }
         else
         {
            _loc2_.x = var_5.x;
            _loc2_.y = var_5.y;
         }
         setRectangle(x + (param1.x - _loc2_.x),y + (param1.y - _loc2_.y),param1.width,param1.height);
      }
      
      public function addEventListener(param1:String, param2:Function, param3:Boolean = false, param4:int = 0, param5:Boolean = false) : void
      {
         if(!_disposed)
         {
            _events.addEventListener(param1,param2,param3,param4,param5);
         }
      }
      
      public function set position(param1:Point) : void
      {
         setRectangle(param1.x,param1.y,var_5.width,var_5.height);
      }
      
      public function get debug() : Boolean
      {
         return var_1329;
      }
      
      public function set height(param1:int) : void
      {
         if(param1 != var_5.height)
         {
            setRectangle(var_5.x,var_5.y,var_5.width,param1);
         }
      }
      
      public function set background(param1:Boolean) : void
      {
         var_711 = param1;
         var_588 = !!var_711 ? uint(var_588 | var_1325) : uint(var_588 & 16777215);
         var_149 = var_149 || param1;
         _context.invalidate(this,var_5,WindowRedrawFlag.const_52);
      }
      
      public function center() : void
      {
         if(var_6 != null)
         {
            x = 0 - 0;
            y = 0 - 0;
         }
      }
      
      public function set properties(param1:Array) : void
      {
      }
      
      public function setupGraphicsContext() : IGraphicContext
      {
         var _loc1_:int = 0;
         var _loc2_:* = null;
         var_14 = getGraphicContext(true);
         if(var_6)
         {
            var_6.setupGraphicsContext();
         }
         if(false)
         {
            if(var_14.numChildContexts != numChildren)
            {
               _loc1_ = 0;
               for each(_loc2_ in _children)
               {
                  var_14.addChildContextAt(_loc2_.getGraphicContext(true),_loc1_++);
               }
            }
         }
         var_1002 = true;
         return var_14;
      }
      
      private function notifyChildren(param1:WindowNotifyEvent) : void
      {
         var _loc2_:* = null;
         for each(_loc2_ in _children)
         {
            _loc2_.update(this,param1);
         }
      }
      
      public function hitTestLocalRectangle(param1:Rectangle) : Boolean
      {
         return var_5.intersects(param1);
      }
      
      public function toString() : String
      {
         return "[Window " + getQualifiedClassName(this) + " " + var_1990 + "]";
      }
      
      protected function notifyEventListeners(param1:WindowEvent) : void
      {
         procedure(param1,this);
         if(!param1.isWindowOperationPrevented())
         {
            if(hasEventListener(param1.type))
            {
               dispatchEvent(param1);
            }
         }
      }
      
      public function set type(param1:uint) : void
      {
         if(param1 != _type)
         {
            _type = param1;
            _context.invalidate(this,var_5,WindowRedrawFlag.const_52);
         }
      }
      
      protected function forwardWindowNotifyEvent(param1:WindowNotifyEvent) : WindowEvent
      {
         var _loc5_:* = null;
         if(_disposed)
         {
            return _loc5_;
         }
         var _loc2_:String = "null";
         var _loc3_:IWindow = !!param1.related ? param1.related : param1.window;
         var _loc4_:Boolean = false;
         switch(param1.type)
         {
            case WindowNotifyEvent.const_500:
               _loc2_ = "null";
               _loc4_ = true;
               break;
            case WindowNotifyEvent.const_209:
               _loc2_ = "null";
               break;
            case WindowNotifyEvent.const_985:
               _loc2_ = "null";
               _loc4_ = true;
               break;
            case WindowNotifyEvent.const_458:
               _loc2_ = "null";
               break;
            case WindowNotifyEvent.const_909:
               _loc2_ = "null";
               _loc4_ = true;
               break;
            case WindowNotifyEvent.const_267:
               _loc2_ = "null";
               break;
            case WindowNotifyEvent.const_951:
               _loc2_ = "null";
               _loc4_ = true;
               break;
            case WindowNotifyEvent.const_782:
               _loc2_ = "null";
               break;
            case WindowNotifyEvent.const_1118:
               _loc2_ = "null";
               _loc4_ = true;
               break;
            case WindowNotifyEvent.const_1193:
               _loc2_ = "null";
               break;
            case WindowNotifyEvent.const_952:
               _loc2_ = "null";
               _loc4_ = true;
               break;
            case WindowNotifyEvent.const_817:
               _loc2_ = "null";
               break;
            case WindowNotifyEvent.const_373:
               _loc2_ = "null";
               _loc4_ = true;
               break;
            case WindowNotifyEvent.const_317:
               _loc2_ = "null";
               break;
            case WindowNotifyEvent.const_672:
               _loc2_ = "null";
               _loc4_ = true;
               break;
            case WindowNotifyEvent.const_559:
               _loc2_ = "null";
               break;
            case WindowNotifyEvent.const_853:
               _loc2_ = "null";
               _loc4_ = true;
               break;
            case WindowNotifyEvent.const_651:
               _loc2_ = "null";
               break;
            case WindowNotifyEvent.const_799:
               _loc2_ = "null";
               _loc4_ = true;
               break;
            case WindowNotifyEvent.const_561:
               _loc2_ = "null";
               break;
            case WindowNotifyEvent.const_876:
               _loc2_ = "null";
               _loc4_ = true;
               break;
            case WindowNotifyEvent.const_813:
               _loc2_ = "null";
               break;
            case WindowNotifyEvent.const_969:
               _loc2_ = "null";
               _loc4_ = true;
               break;
            case WindowNotifyEvent.const_877:
               _loc2_ = "null";
               break;
            case WindowNotifyEvent.const_894:
               _loc2_ = "null";
               _loc4_ = true;
               break;
            case WindowNotifyEvent.const_770:
               _loc2_ = "null";
               break;
            case WindowNotifyEvent.const_863:
               _loc2_ = "null";
               _loc4_ = true;
               break;
            case WindowNotifyEvent.const_871:
               _loc2_ = "null";
               break;
            case WindowNotifyEvent.const_949:
               _loc2_ = "null";
               _loc4_ = true;
               break;
            case WindowNotifyEvent.const_944:
               _loc2_ = "null";
               break;
            case WindowNotifyEvent.const_869:
               _loc2_ = "null";
               _loc4_ = true;
               break;
            case WindowNotifyEvent.const_830:
               _loc2_ = "null";
               break;
            case WindowNotifyEvent.const_993:
               _loc2_ = "null";
               _loc4_ = true;
               break;
            case WindowNotifyEvent.const_935:
               _loc2_ = "null";
               break;
            case WindowNotifyEvent.const_394:
               _loc2_ = "null";
               break;
            case WindowNotifyEvent.const_395:
               _loc2_ = "null";
               break;
            case WindowNotifyEvent.const_347:
               _loc2_ = "null";
               break;
            case WindowNotifyEvent.const_583:
               _loc2_ = "null";
               break;
            case WindowNotifyEvent.const_174:
               _loc2_ = "null";
               break;
            case WindowNotifyEvent.const_899:
               _loc2_ = "null";
               break;
            case WindowNotifyEvent.const_230:
               _loc2_ = "null";
               break;
            case WindowNotifyEvent.const_360:
               _loc2_ = "null";
               break;
            case WindowNotifyEvent.const_298:
               _loc2_ = "null";
               break;
            case WindowNotifyEvent.const_992:
               _loc2_ = "null";
               break;
            case WindowNotifyEvent.const_590:
               _loc2_ = "null";
               break;
            case WindowNotifyEvent.const_409:
               _loc2_ = "null";
               break;
            case WindowNotifyEvent.const_243:
               _loc2_ = "null";
         }
         if(_loc2_ == WindowEvent.const_160)
         {
            throw new Error("Unknown window notify event: " + param1.type + "!");
         }
         _loc5_ = new WindowEvent(_loc2_,this,_loc3_,false,_loc4_);
         procedure(_loc5_,this);
         if(!_disposed)
         {
            if(!(_loc4_ && _loc5_.isWindowOperationPrevented()))
            {
               if(hasEventListener(_loc2_))
               {
                  dispatchEvent(_loc5_);
               }
            }
            if(param1.cancelable)
            {
               if(_loc5_.isWindowOperationPrevented())
               {
                  param1.preventWindowOperation();
               }
            }
         }
         return _loc5_;
      }
      
      public function setStyleFlag(param1:uint, param2:Boolean = true) : void
      {
         var _loc3_:uint = var_73;
         var _loc4_:*;
         var_73 = !!param2 ? (_loc4_ = var_73 | param1, var_73 |= param1, uint(_loc4_)) : (_loc4_ = var_73 & ~param1, var_73 &= ~param1, uint(_loc4_));
         if(var_73 != _loc3_)
         {
            update(this,new WindowNotifyEvent(WindowNotifyEvent.const_394,this,null));
         }
      }
      
      public function open() : Boolean
      {
         if(getStateFlag(WindowState.const_61))
         {
            return true;
         }
         var _loc1_:WindowNotifyEvent = new WindowNotifyEvent(WindowNotifyEvent.const_876,this,null);
         update(this,_loc1_);
         if(_loc1_.isDefaultPrevented())
         {
            return false;
         }
         visible = true;
         _loc1_.type = WindowNotifyEvent.const_813;
         update(this,_loc1_);
         return true;
      }
      
      public function swapChildrenAt(param1:int, param2:int) : void
      {
         swapChildren(_children[param1],_children[param2]);
         var_14.swapChildContextsAt(param1,param2);
      }
      
      public function getChildByName(param1:String) : IWindow
      {
         var _loc2_:* = null;
         for each(_loc2_ in _children)
         {
            if(_loc2_.name == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function deactivate() : Boolean
      {
         if(!getStateFlag(WindowState.const_73))
         {
            return true;
         }
         var _loc1_:WindowNotifyEvent = new WindowNotifyEvent(WindowNotifyEvent.const_951,this,null);
         update(this,_loc1_);
         if(_loc1_.isDefaultPrevented())
         {
            return false;
         }
         setStateFlag(WindowState.const_73,false);
         _loc1_.type = WindowNotifyEvent.const_782;
         update(this,_loc1_);
         return true;
      }
      
      public function restore() : Boolean
      {
         var _loc1_:WindowNotifyEvent = new WindowNotifyEvent(WindowNotifyEvent.const_949,this,null);
         update(this,_loc1_);
         if(_loc1_.isDefaultPrevented())
         {
            return false;
         }
         setStateFlag(WindowState.const_45,false);
         _loc1_.type = WindowNotifyEvent.const_944;
         update(this,_loc1_);
         return true;
      }
      
      public function offset(param1:Number, param2:Number) : void
      {
         setRectangle(var_5.x + param1,var_5.y + param2,var_5.width,var_5.height);
      }
      
      public function getGraphicContext(param1:Boolean) : IGraphicContext
      {
         if(param1 && !var_14)
         {
            var_14 = new GraphicContext("GC {" + _name + "}",GraphicContext.GC_TYPE_BITMAP,var_5);
            var_14.visible = var_326;
         }
         return var_14;
      }
      
      public function minimize() : Boolean
      {
         if(var_31 & 0)
         {
            return false;
         }
         var _loc1_:WindowNotifyEvent = new WindowNotifyEvent(WindowNotifyEvent.const_894,this,null);
         update(this,_loc1_);
         if(_loc1_.isDefaultPrevented())
         {
            return false;
         }
         setStateFlag(WindowState.const_45,true);
         _loc1_.type = WindowNotifyEvent.const_770;
         update(this,_loc1_);
         return true;
      }
      
      public function findChildByTag(param1:String) : IWindow
      {
         if(var_589.indexOf(param1) > -1)
         {
            return this;
         }
         var _loc2_:WindowController = WindowController(getChildByTag(param1));
         if(_loc2_ == null)
         {
            for each(_loc2_ in _children)
            {
               _loc2_ = _loc2_.findChildByTag(param1) as WindowController;
               if(_loc2_ != null)
               {
                  break;
               }
            }
         }
         return _loc2_ as IWindow;
      }
      
      protected function isChildWindow() : Boolean
      {
         return var_6 != context.getDesktopWindow();
      }
      
      public function set debug(param1:Boolean) : void
      {
         var_1329 = param1;
      }
      
      public function set blend(param1:Number) : void
      {
         var_407 = param1 > 1 ? 1 : (param1 < 0 ? 0 : Number(param1));
         _context.invalidate(this,var_5,WindowRedrawFlag.const_846);
      }
      
      public function addChildAt(param1:IWindow, param2:int) : IWindow
      {
         var _loc3_:WindowController = WindowController(param1);
         if(_loc3_.parent != null)
         {
            WindowController(_loc3_.parent).removeChild(_loc3_);
         }
         _children.splice(param2,0,_loc3_);
         _loc3_.parent = this;
         if(var_1002 || _loc3_.hasGraphicsContext())
         {
            setupGraphicsContext();
            if(_loc3_.getGraphicContext(true).parent != var_14)
            {
               var_14.addChildContextAt(_loc3_.getGraphicContext(true),param2);
            }
         }
         update(this,new WindowNotifyEvent(WindowNotifyEvent.const_298,this,param1));
         return param1;
      }
      
      public function swapChildren(param1:IWindow, param2:IWindow) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:* = null;
         var _loc6_:int = 0;
         if(param1 != null && param2 != null && param1 != param2)
         {
            _loc3_ = _children.indexOf(param1);
            if(_loc3_ < 0)
            {
               return;
            }
            _loc4_ = _children.indexOf(param2);
            if(_loc4_ < 0)
            {
               return;
            }
            if(_loc4_ < _loc3_)
            {
               _loc5_ = param1;
               param1 = param2;
               param2 = _loc5_;
               _loc6_ = _loc3_;
               _loc3_ = _loc4_;
               _loc4_ = _loc6_;
            }
            _children.splice(_loc4_,1);
            _children.splice(_loc3_,1);
            _children.splice(_loc3_,0,param2);
            _children.splice(_loc4_,0,param1);
            if(WindowController(param1).hasGraphicsContext() || WindowController(param2).hasGraphicsContext())
            {
               var_14.swapChildContexts(WindowController(param1).getGraphicContext(true),WindowController(param2).getGraphicContext(true));
            }
         }
      }
      
      public function get parent() : IWindow
      {
         return var_6;
      }
      
      public function getRegionProperties(param1:Rectangle = null, param2:Rectangle = null, param3:Rectangle = null, param4:Rectangle = null) : void
      {
         if(param1 != null)
         {
            param1.x = var_5.x;
            param1.y = var_5.y;
            param1.width = var_5.width;
            param1.height = var_5.height;
         }
         if(param2 != null)
         {
            param2.x = var_47.x;
            param2.y = var_47.y;
            param2.width = var_47.width;
            param2.height = var_47.height;
         }
         if(param3 != null && var_135 != null)
         {
            param3.x = var_135.x;
            param3.y = var_135.y;
            param3.width = var_135.width;
            param3.height = var_135.height;
         }
         if(param4 != null && var_134 != null)
         {
            param4.x = var_134.x;
            param4.y = var_134.y;
            param4.width = var_134.width;
            param4.height = var_134.height;
         }
      }
      
      protected function requiresOwnGraphicContext() : Boolean
      {
         var _loc1_:* = null;
         if(testParamFlag(WindowParam.const_15))
         {
            for each(_loc1_ in _children)
            {
               if(_loc1_.requiresOwnGraphicContext())
               {
                  return true;
               }
            }
            return false;
         }
         return true;
      }
      
      public function hasGraphicsContext() : Boolean
      {
         return !testParamFlag(WindowParam.const_15) || var_14 != null;
      }
      
      public function getMouseRegion(param1:Rectangle) : void
      {
         var _loc2_:* = null;
         getGlobalRectangle(param1);
         if(param1.width < 0)
         {
            param1.width = 0;
         }
         if(param1.height < 0)
         {
            param1.height = 0;
         }
         if(testParamFlag(WindowParam.const_15))
         {
            _loc2_ = new Rectangle();
            IWindow(var_6).getMouseRegion(_loc2_);
            if(param1.left < _loc2_.left)
            {
               param1.left = _loc2_.left;
            }
            if(param1.top < _loc2_.top)
            {
               param1.top = _loc2_.top;
            }
            if(param1.right > _loc2_.right)
            {
               param1.right = _loc2_.right;
            }
            if(param1.bottom > _loc2_.bottom)
            {
               param1.bottom = _loc2_.bottom;
            }
         }
      }
      
      public function validateLocalPointIntersection(param1:Point, param2:BitmapData) : Boolean
      {
         return method_4(param1,param2,var_713);
      }
      
      public function set color(param1:uint) : void
      {
         var_1325 = param1 & 4278190080;
         var_588 = !!var_711 ? uint(param1) : uint(param1 & 16777215);
         _context.invalidate(this,var_5,WindowRedrawFlag.const_52);
      }
      
      public function update(param1:WindowController, param2:Event) : Boolean
      {
         var _loc3_:* = null;
         var _loc4_:* = undefined;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = 0;
         var _loc8_:* = 0;
         if(!testParamFlag(WindowParam.const_548))
         {
            if(param2 is MouseEvent)
            {
               _loc3_ = forwardMouseEvent(param2 as MouseEvent);
            }
            else if(param2 is KeyboardEvent)
            {
               _loc3_ = forwardKeyboardEvent(param2 as KeyboardEvent);
            }
            else if(param2 is WindowNotifyEvent)
            {
               _loc3_ = forwardWindowNotifyEvent(param2 as WindowNotifyEvent);
            }
            else if(param2 is Event)
            {
               _loc3_ = forwardNormalEvent(param2);
            }
            if(_disposed)
            {
               return true;
            }
            if(_loc3_.cancelable)
            {
               if(_loc3_.isWindowOperationPrevented())
               {
                  return true;
               }
            }
            if(param2.cancelable)
            {
               if(!param2.isDefaultPrevented())
               {
                  return true;
               }
            }
         }
         if(param2 is MouseEvent)
         {
            switch(param2.type)
            {
               case MouseEvent.MOUSE_DOWN:
                  if(activate())
                  {
                     if(param2.cancelable)
                     {
                        param2.preventDefault();
                     }
                  }
                  setStateFlag(WindowState.const_71,true);
                  _loc4_ = _context.getWindowServices().getMouseListenerService();
                  _loc4_.begin(this);
                  _loc4_.eventTypes.push(MouseEvent.MOUSE_UP);
                  _loc4_.areaLimit = MouseListenerType.const_987;
                  if(testParamFlag(WindowParam.const_279))
                  {
                     _loc5_ = {};
                     while(_loc5_ != null)
                     {
                        if(_loc5_.testParamFlag(WindowParam.const_178))
                        {
                           _context.getWindowServices().getMouseDraggingService().begin(_loc5_);
                           break;
                        }
                        _loc5_ = _loc5_.parent;
                     }
                  }
                  if((var_13 & 0) > 0)
                  {
                     _loc5_ = {};
                     while(_loc5_ != null)
                     {
                        if(_loc5_.testParamFlag(WindowParam.const_247))
                        {
                           _context.getWindowServices().getMouseScalingService().begin(_loc5_,var_13 & 0);
                           break;
                        }
                        _loc5_ = _loc5_.parent;
                     }
                  }
                  break;
               case MouseEvent.MOUSE_UP:
                  if(testStateFlag(WindowState.const_71))
                  {
                     setStateFlag(WindowState.const_71,false);
                  }
                  _context.getWindowServices().getMouseListenerService().end(this);
                  if(testParamFlag(WindowParam.const_178))
                  {
                     _context.getWindowServices().getMouseDraggingService().end(this);
                  }
                  if(testParamFlag(WindowParam.const_247))
                  {
                     _context.getWindowServices().getMouseScalingService().end(this);
                  }
                  break;
               case MouseEvent.MOUSE_OUT:
                  if(testStateFlag(WindowState.const_59))
                  {
                     setStateFlag(WindowState.const_59,false);
                  }
                  break;
               case MouseEvent.MOUSE_OVER:
                  if(!testStateFlag(WindowState.const_59))
                  {
                     setStateFlag(WindowState.const_59,true);
                  }
                  break;
               case MouseEvent.MOUSE_WHEEL:
                  return false;
            }
         }
         if(param2 is WindowNotifyEvent)
         {
            switch(param2.type)
            {
               case WindowNotifyEvent.const_209:
                  _context.invalidate(this,var_5.union(var_47),WindowRedrawFlag.RESIZE);
                  if(param1 == this)
                  {
                     notifyChildren(new WindowNotifyEvent(WindowNotifyEvent.const_409,this,null));
                     if(testParamFlag(WindowParam.const_146,WindowParam.const_123))
                     {
                        updateScaleRelativeToParent();
                     }
                     else if(testParamFlag(WindowParam.const_141,WindowParam.const_125))
                     {
                        updateScaleRelativeToParent();
                     }
                     if(var_6 != null)
                     {
                        _loc8_ = uint(var_13);
                        var_13 &= ~(0 | 0);
                        if(testParamFlag(WindowParam.const_383))
                        {
                           var_6.width += 0 - 0;
                        }
                        if(testParamFlag(WindowParam.WINDOW_PARAM_REFLECT_VERTICAL_RESIZE_TO_PARENT))
                        {
                           var_6.height += 0 - 0;
                        }
                        var_13 = _loc8_;
                        var_6.update(this,new WindowNotifyEvent(WindowNotifyEvent.const_243,var_6,this));
                     }
                  }
                  break;
               case WindowNotifyEvent.const_458:
                  _context.invalidate(this,var_5.union(var_47),WindowRedrawFlag.const_361);
                  if(param1 == this)
                  {
                     notifyChildren(new WindowNotifyEvent(WindowNotifyEvent.const_899,this,null));
                     if(var_6 != null)
                     {
                        var_6.update(this,new WindowNotifyEvent(WindowNotifyEvent.const_230,var_6,this));
                     }
                  }
                  break;
               case WindowNotifyEvent.const_267:
                  if(param1 == this)
                  {
                     notifyChildren(new WindowNotifyEvent(WindowNotifyEvent.const_583,this,null));
                     if(var_6 != null)
                     {
                        var_6.update(this,new WindowNotifyEvent(WindowNotifyEvent.const_174,var_6,this));
                     }
                  }
                  break;
               case WindowNotifyEvent.const_395:
                  _context.invalidate(this,var_5,WindowRedrawFlag.const_837);
                  break;
               case WindowNotifyEvent.const_394:
                  _loc6_ = new Array();
                  groupChildrenWithTag(WindowController.INTERNAL_CHILD_TAG,_loc6_);
                  _loc7_ = uint(_loc6_.length);
                  while(--_loc7_ > -1)
                  {
                     WindowController(_loc6_[_loc7_]).style = var_73;
                  }
                  _context.invalidate(this,var_5,WindowRedrawFlag.const_52);
                  break;
               case WindowNotifyEvent.const_347:
                  if(!(var_13 & 0))
                  {
                     if(!var_14)
                     {
                        setupGraphicsContext();
                        _context.invalidate(this,var_5,WindowRedrawFlag.const_361);
                     }
                  }
                  else if(var_13 & 0)
                  {
                     if(var_14)
                     {
                        _context.invalidate(this,var_5,WindowRedrawFlag.const_361);
                     }
                  }
                  break;
               case WindowNotifyEvent.const_360:
                  if(testParamFlag(WindowParam.const_146,WindowParam.const_123))
                  {
                     updateScaleRelativeToParent();
                  }
                  else if(testParamFlag(WindowParam.const_141,WindowParam.const_125))
                  {
                     updateScaleRelativeToParent();
                  }
                  _context.invalidate(this,var_5,WindowRedrawFlag.const_52);
                  break;
               case WindowNotifyEvent.const_174:
                  activate();
                  break;
               case WindowNotifyEvent.const_409:
                  var_6.getRegionProperties(null,var_290);
                  updateScaleRelativeToParent();
                  break;
               case WindowNotifyEvent.const_298:
                  if(testParamFlag(WindowParam.const_44))
                  {
                     expandToAccommodateChild(this,WindowNotifyEvent(param2).related);
                  }
                  break;
               case WindowNotifyEvent.const_230:
                  if(testParamFlag(WindowParam.const_44))
                  {
                     expandToAccommodateChild(this,WindowNotifyEvent(param2).related);
                  }
                  break;
               case WindowNotifyEvent.const_590:
                  break;
               case WindowNotifyEvent.const_243:
                  if(testParamFlag(WindowParam.const_44))
                  {
                     expandToAccommodateChild(this,WindowNotifyEvent(param2).related);
                  }
            }
         }
         return true;
      }
      
      public function get procedure() : Function
      {
         return var_590 != null ? var_590 : (var_6 != null ? var_6.procedure : nullEventProc);
      }
      
      public function getGlobalRectangle(param1:Rectangle) : void
      {
         var _loc2_:Rectangle = var_5;
         if(var_6 != null)
         {
            var_6.getGlobalRectangle(param1);
            param1.x += _loc2_.x;
            param1.y += _loc2_.y;
         }
         else
         {
            param1.x = _loc2_.x;
            param1.y = _loc2_.y;
         }
         param1.width = _loc2_.width;
         param1.height = _loc2_.height;
      }
      
      public function focus() : Boolean
      {
         if(getStateFlag(WindowState.const_53))
         {
            return true;
         }
         var _loc1_:WindowNotifyEvent = new WindowNotifyEvent(WindowNotifyEvent.const_869,this,null);
         update(this,_loc1_);
         if(_loc1_.isDefaultPrevented())
         {
            return false;
         }
         setStateFlag(WindowState.const_53,true);
         _loc1_.type = WindowNotifyEvent.const_830;
         update(this,_loc1_);
         return true;
      }
      
      public function maximize() : Boolean
      {
         if(var_31 & 0)
         {
            return false;
         }
         var _loc1_:WindowNotifyEvent = new WindowNotifyEvent(WindowNotifyEvent.const_863,this,null);
         update(this,_loc1_);
         if(_loc1_.isDefaultPrevented())
         {
            return false;
         }
         setStateFlag(WindowState.const_45,true);
         _loc1_.type = WindowNotifyEvent.const_871;
         update(this,_loc1_);
         return true;
      }
      
      public function set rectangle(param1:Rectangle) : void
      {
         setRectangle(param1.x,param1.y,param1.width,param1.height);
      }
      
      public function validateGlobalPointIntersection(param1:Point, param2:BitmapData) : Boolean
      {
         var _loc3_:Point = new Point();
         getGlobalPosition(_loc3_);
         _loc3_.x = param1.x - _loc3_.x;
         _loc3_.y = param1.y - _loc3_.y;
         return method_4(_loc3_,param2,var_713);
      }
      
      public function getGlobalPosition(param1:Point) : void
      {
         if(var_6 != null)
         {
            var_6.getGlobalPosition(param1);
            param1.x += var_5.x;
            param1.y += var_5.y;
         }
         else
         {
            param1.x = var_5.x;
            param1.y = var_5.y;
         }
      }
      
      public function getParamFlag(param1:uint) : Boolean
      {
         return (var_13 & param1) != 0;
      }
      
      public function set visible(param1:Boolean) : void
      {
         if(param1 != var_326)
         {
            var_326 = param1;
            if(var_14)
            {
               var_14.visible = param1;
            }
            _context.invalidate(this,var_5,WindowRedrawFlag.const_52);
         }
      }
      
      public function getStateFlag(param1:uint) : Boolean
      {
         return (var_31 & param1) != 0;
      }
      
      public function resolveVerticalScale() : Number
      {
         return 0 / 0;
      }
      
      public function set x(param1:int) : void
      {
         if(param1 != var_5.x)
         {
            setRectangle(param1,var_5.y,var_5.width,var_5.height);
         }
      }
      
      public function set y(param1:int) : void
      {
         if(param1 != var_5.y)
         {
            setRectangle(var_5.x,param1,var_5.width,var_5.height);
         }
      }
      
      public function activate() : Boolean
      {
         var _loc1_:WindowNotifyEvent = new WindowNotifyEvent(WindowNotifyEvent.const_909,this,null);
         update(this,_loc1_);
         if(_loc1_.isDefaultPrevented())
         {
            return false;
         }
         setStateFlag(WindowState.const_73,true);
         _loc1_.type = WindowNotifyEvent.const_267;
         update(this,_loc1_);
         return true;
      }
      
      public function hasEventListener(param1:String) : Boolean
      {
         return !!_disposed ? false : Boolean(_events.hasEventListener(param1));
      }
      
      public function setGlobalPosition(param1:Point) : void
      {
         var _loc2_:Point = new Point();
         if(var_6 != null)
         {
            var_6.getGlobalPosition(_loc2_);
            _loc2_.x += var_5.x;
            _loc2_.y += var_5.y;
         }
         else
         {
            _loc2_.x = var_5.x;
            _loc2_.y = var_5.y;
         }
         x += param1.x - _loc2_.x;
         y += param1.y - _loc2_.y;
      }
      
      public function isCapableOfUsingSharedGraphicContext() : Boolean
      {
         return true;
      }
      
      public function removeChild(param1:IWindow) : IWindow
      {
         var _loc2_:int = _children.indexOf(param1);
         if(_loc2_ < 0)
         {
            return null;
         }
         _children.splice(_loc2_,1);
         var _loc3_:WindowController = WindowController(param1);
         _loc3_.parent = null;
         if(_loc3_.hasGraphicsContext())
         {
            var_14.removeChildContext(_loc3_.getGraphicContext(true));
         }
         update(this,new WindowNotifyEvent(WindowNotifyEvent.const_590,this,param1));
         return param1;
      }
      
      public function disable() : Boolean
      {
         if(getStateFlag(WindowState.const_51))
         {
            return true;
         }
         var _loc1_:WindowNotifyEvent = new WindowNotifyEvent(WindowNotifyEvent.const_799,this,null);
         update(this,_loc1_);
         if(_loc1_.isDefaultPrevented())
         {
            return false;
         }
         setStateFlag(WindowState.const_51,true);
         _loc1_.type = WindowNotifyEvent.const_561;
         update(this,_loc1_);
         return true;
      }
      
      public function getAbsoluteMousePosition(param1:Point) : void
      {
         param1.x = _context.getDesktopWindow().mouseX;
         param1.y = _context.getDesktopWindow().mouseY;
      }
      
      public function addChild(param1:IWindow) : IWindow
      {
         var _loc2_:WindowController = WindowController(param1);
         if(_loc2_.parent != null)
         {
            WindowController(_loc2_.parent).removeChild(_loc2_);
         }
         _children.push(_loc2_);
         _loc2_.parent = this;
         if(var_1002 || _loc2_.hasGraphicsContext())
         {
            setupGraphicsContext();
            if(_loc2_.getGraphicContext(true).parent != var_14)
            {
               var_14.addChildContext(_loc2_.getGraphicContext(true));
            }
         }
         update(this,new WindowNotifyEvent(WindowNotifyEvent.const_298,this,param1));
         return param1;
      }
      
      public function fetchDrawBuffer() : IBitmapDrawable
      {
         return !testParamFlag(WindowParam.const_15) ? getGraphicContext(true).fetchDrawBuffer() : (var_6 != null ? var_6.fetchDrawBuffer() : null);
      }
      
      public function getChildIndex(param1:IWindow) : int
      {
         return _children.indexOf(param1);
      }
      
      public function setChildIndex(param1:IWindow, param2:int) : void
      {
         var _loc4_:* = null;
         var _loc3_:int = _children.indexOf(param1);
         if(_loc3_ > -1 && param2 != _loc3_)
         {
            _children.splice(_loc3_,1);
            _children.splice(param2,0,param1);
            _loc4_ = WindowController(param1);
            if(_loc4_.hasGraphicsContext())
            {
               var_14.setChildContextIndex(_loc4_.getGraphicContext(true),getChildIndex(_loc4_));
            }
         }
      }
      
      public function set name(param1:String) : void
      {
         _name = param1;
      }
      
      public function set state(param1:uint) : void
      {
         if(param1 != var_31)
         {
            var_31 = param1;
            update(this,new WindowNotifyEvent(WindowNotifyEvent.const_395,this,null));
         }
      }
      
      public function findParentByName(param1:String) : IWindow
      {
         if(_name == param1)
         {
            return this;
         }
         if(var_6 != null)
         {
            if(var_6.name == param1)
            {
               return var_6;
            }
            return var_6.findParentByName(param1);
         }
         return null;
      }
      
      public function setRectangle(param1:int, param2:int, param3:int, param4:int) : void
      {
         var _loc7_:* = 0;
         var _loc9_:* = null;
         var _loc10_:* = null;
         param4 = Math.max(var_67.minHeight,param4);
         param4 = Math.min(var_67.maxHeight,param4);
         param3 = Math.max(var_67.minWidth,param3);
         param3 = Math.min(var_67.maxWidth,param3);
         var _loc5_:Boolean = param1 != var_5.x || param2 != var_5.y;
         var _loc6_:Boolean = param3 != var_5.width || param4 != var_5.height;
         if(_loc6_ && !_loc5_)
         {
            _loc7_ = uint(var_13 & 0);
            if(_loc7_ == WindowParam.const_402)
            {
               param1 -= (param3 - 0) / 2;
               _loc5_ = true;
            }
            else if(_loc7_ == WindowParam.const_345)
            {
               param1 -= param3 - 0;
               _loc5_ = true;
            }
            _loc7_ = uint(var_13 & 0);
            if(_loc7_ == WindowParam.const_432)
            {
               param2 -= (param4 - 0) / 2;
               _loc5_ = true;
            }
            else if(_loc7_ == WindowParam.const_397)
            {
               param2 -= param4 - 0;
               _loc5_ = true;
            }
         }
         if(testParamFlag(WindowParam.const_67))
         {
            if(var_6 != null)
            {
               _loc9_ = var_6.rectangle;
               param1 = param1 < 0 ? 0 : int(param1);
               param2 = param2 < 0 ? 0 : int(param2);
               if(_loc5_)
               {
                  param1 -= param1 + param3 > _loc9_.width ? param1 + param3 - _loc9_.width : 0;
                  param2 -= param2 + param4 > _loc9_.height ? param2 + param4 - _loc9_.height : 0;
                  _loc5_ = param1 != var_5.x || param2 != var_5.y;
               }
               else
               {
                  param3 -= param1 + param3 > _loc9_.width ? param1 + param3 - _loc9_.width : 0;
                  param4 -= param2 + param4 > _loc9_.height ? param2 + param4 - _loc9_.height : 0;
                  _loc6_ = param3 != var_5.width || param4 != var_5.height;
               }
            }
         }
         if(_loc5_ || _loc6_)
         {
            if(_loc5_)
            {
               _loc10_ = new WindowNotifyEvent(WindowNotifyEvent.const_985,this,null,true);
               update(this,_loc10_);
               if(_loc10_.isWindowOperationPrevented())
               {
                  _loc5_ = false;
               }
            }
            if(_loc6_)
            {
               _loc10_ = new WindowNotifyEvent(WindowNotifyEvent.const_500,this,null,true);
               update(this,_loc10_);
               if(_loc10_.isWindowOperationPrevented())
               {
                  _loc6_ = false;
               }
            }
            if(_loc5_)
            {
               var_47.x = var_5.x;
               var_47.y = var_5.y;
               var_47.width = var_5.width;
               var_47.height = var_5.height;
               var_5.x = param1;
               var_5.y = param2;
            }
            if(_loc6_)
            {
               var_47.width = var_5.width;
               var_47.height = var_5.height;
               var_5.width = param3;
               var_5.height = param4;
            }
            if(_loc5_)
            {
               update(this,new WindowNotifyEvent(WindowNotifyEvent.const_458,this,null));
            }
            if(_loc6_)
            {
               update(this,new WindowNotifyEvent(WindowNotifyEvent.const_209,this,null));
            }
         }
      }
      
      public function lock() : Boolean
      {
         if(getStateFlag(WindowState.const_45))
         {
            return true;
         }
         var _loc1_:WindowNotifyEvent = new WindowNotifyEvent(WindowNotifyEvent.const_1209,this,null);
         update(this,_loc1_);
         if(_loc1_.isDefaultPrevented())
         {
            return false;
         }
         setStateFlag(WindowState.const_45,true);
         _loc1_.type = WindowNotifyEvent.const_1258;
         update(this,_loc1_);
         return true;
      }
      
      protected function method_4(param1:Point, param2:BitmapData, param3:uint) : Boolean
      {
         var _loc5_:* = null;
         var _loc4_:Boolean = false;
         if(true || true)
         {
            return false;
         }
         if(var_149 && var_713 > 0)
         {
            if(!testParamFlag(WindowParam.const_15))
            {
               if(param1.x <= var_5.width && param1.y <= var_5.height)
               {
                  _loc5_ = getGraphicContext(true).fetchDrawBuffer() as BitmapData;
                  if(_loc5_ != null)
                  {
                     _loc4_ = _loc5_.hitTest(var_1472,param3,param1);
                  }
               }
            }
            else
            {
               _loc4_ = param2 != null ? Boolean(param2.hitTest(var_1472,param3,param1)) : false;
            }
         }
         else if(param1.x >= 0 && param1.x < var_5.width)
         {
            if(param1.y >= 0 && param1.y < var_5.height)
            {
               _loc4_ = true;
            }
         }
         return _loc4_;
      }
      
      public function get properties() : Array
      {
         return new Array();
      }
      
      override public function invalidate(param1:Rectangle = null) : void
      {
         if(param1 == null)
         {
            param1 = var_5;
         }
         _context.invalidate(this,param1,WindowRedrawFlag.const_52);
      }
      
      public function convertPointFromLocalToGlobalSpace(param1:Point) : void
      {
         var _loc2_:Number = param1.x;
         var _loc3_:Number = param1.y;
         if(var_6 == null)
         {
            param1.x = var_5.x;
            param1.y = var_5.y;
         }
         else
         {
            var_6.getGlobalPosition(param1);
            param1.x += var_5.x;
            param1.y += var_5.y;
         }
         param1.x += _loc2_;
         param1.y += _loc3_;
      }
      
      private function nullEventProc(param1:WindowEvent, param2:IWindow) : void
      {
      }
      
      public function getDrawRegion(param1:Rectangle) : void
      {
         if(!testParamFlag(WindowParam.const_15))
         {
            param1.x = 0;
            param1.y = 0;
            param1.width = var_5.width;
            param1.height = var_5.height;
         }
         else if(var_6 != null)
         {
            var_6.getDrawRegion(param1);
            param1.x += var_5.x;
            param1.y += var_5.y;
            param1.width = var_5.width;
            param1.height = var_5.height;
         }
         else
         {
            param1.x = 0;
            param1.y = 0;
            param1.width = 0;
            param1.height = 0;
         }
      }
      
      public function scale(param1:Number, param2:Number) : void
      {
         setRectangle(var_5.x,var_5.y,var_5.width + param1,var_5.height + param2);
      }
      
      public function getLocalRectangle(param1:Rectangle) : void
      {
         param1.x = var_5.x;
         param1.y = var_5.y;
         param1.width = var_5.width;
         param1.height = var_5.height;
      }
      
      public function unlock() : Boolean
      {
         if(!getStateFlag(WindowState.const_45))
         {
            return true;
         }
         var _loc1_:WindowNotifyEvent = new WindowNotifyEvent(WindowNotifyEvent.const_1127,this,null);
         update(this,_loc1_);
         if(_loc1_.isDefaultPrevented())
         {
            return false;
         }
         setStateFlag(WindowState.const_45,false);
         _loc1_.type = WindowNotifyEvent.const_1172;
         update(this,_loc1_);
         return true;
      }
      
      public function set parent(param1:IWindow) : void
      {
         var _loc3_:* = null;
         if(param1 == this)
         {
            throw new Error("Attempted to assign self as parent!");
         }
         if(param1 != null && param1.context != _context)
         {
            _context = WindowContext(param1.context);
            for each(_loc3_ in _children)
            {
               _loc3_.parent = this;
            }
         }
         var _loc2_:IWindow = var_6;
         if(var_6 != param1)
         {
            if(var_6 != null)
            {
               var_6.removeChild(this);
            }
            var_6 = WindowController(param1);
            if(var_6 != null)
            {
               var_290 = var_6.rectangle.clone();
               var_47.x = var_5.x;
               var_47.y = var_5.y;
               var_47.width = var_5.width;
               var_47.height = var_5.height;
               update(this,new WindowNotifyEvent(WindowNotifyEvent.const_360,this,var_6));
            }
            else
            {
               var_290.x = 0;
               var_290.y = 0;
               var_290.width = 0;
               var_290.height = 0;
               update(this,new WindowNotifyEvent(WindowNotifyEvent.const_992,this,_loc2_));
            }
         }
      }
      
      public function setParamFlag(param1:uint, param2:Boolean = true) : void
      {
         var _loc3_:uint = var_13;
         var _loc4_:*;
         var_13 = !!param2 ? (_loc4_ = var_13 | param1, var_13 |= param1, uint(_loc4_)) : (_loc4_ = var_13 & ~param1, var_13 &= ~param1, uint(_loc4_));
         if(var_13 != _loc3_)
         {
            update(this,new WindowNotifyEvent(WindowNotifyEvent.const_347,this,null));
         }
      }
      
      public function expandToAccommodateChildren() : void
      {
         var _loc1_:* = null;
         var _loc6_:* = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc7_:Boolean = false;
         var _loc8_:Boolean = getParamFlag(WindowParam.const_44);
         for each(_loc1_ in _children)
         {
            _loc6_ = _loc1_.rectangle;
            if(_loc6_.x < _loc2_)
            {
               _loc4_ -= _loc6_.x - _loc2_;
               _loc2_ = _loc6_.x;
               _loc7_ = true;
            }
            if(_loc6_.right > _loc4_)
            {
               _loc4_ = _loc6_.x + _loc6_.width;
               _loc7_ = true;
            }
            if(_loc6_.y < _loc3_)
            {
               _loc5_ -= _loc6_.y - _loc3_;
               _loc3_ = _loc6_.y;
               _loc7_ = true;
            }
            if(_loc6_.bottom > _loc5_)
            {
               _loc5_ = _loc6_.y + _loc6_.height;
               _loc7_ = true;
            }
         }
         if(_loc7_)
         {
            if(_loc8_)
            {
               setParamFlag(WindowParam.const_44,false);
            }
            setRectangle(var_5.x + _loc2_,var_5.y + _loc3_,_loc4_,_loc5_);
            for each(_loc1_ in _children)
            {
               _loc1_.offset(-_loc2_,-_loc3_);
            }
            if(_loc8_)
            {
               setParamFlag(WindowParam.const_44,true);
            }
         }
      }
      
      public function removeChildAt(param1:int) : IWindow
      {
         return removeChild(getChildAt(param1));
      }
      
      public function clone() : IWindow
      {
         var _loc1_:Class = getDefinitionByName(getQualifiedClassName(this)) as Class;
         var _loc2_:WindowController = new _loc1_(_name,_type,var_73,var_13,_context,var_5,null,var_590,properties,var_589.concat(),_id) as WindowController;
         _loc2_.var_713 = var_713;
         _loc2_.var_149 = var_149;
         _loc2_.var_1329 = var_1329;
         _loc2_.var_290 = var_290.clone();
         _loc2_.var_5 = var_5.clone();
         _loc2_.var_346 = var_346.clone();
         _loc2_.var_47 = var_47.clone();
         _loc2_.var_135 = !!var_135 ? var_135.clone() : null;
         _loc2_.var_134 = !!var_134 ? var_134.clone() : null;
         _loc2_.var_67 = !!var_67 ? var_67.clone(_loc2_) : null;
         _loc2_._context = _context;
         _loc2_.var_588 = var_588;
         _loc2_.var_1325 = var_1325;
         _loc2_.var_1058 = var_1058;
         _loc2_.var_326 = var_326;
         _loc2_.var_407 = var_407;
         _loc2_.var_13 = var_13;
         _loc2_.var_31 = var_31;
         _loc2_._name = _name;
         _loc2_._id = _id;
         _loc2_.caption = var_301;
         _loc2_.background = var_711;
         cloneChildWindows(_loc2_);
         return _loc2_;
      }
      
      public function set style(param1:uint) : void
      {
         if(param1 != var_73)
         {
            var_73 = param1;
            update(this,new WindowNotifyEvent(WindowNotifyEvent.const_394,this,null));
         }
      }
      
      public function setStateFlag(param1:uint, param2:Boolean = true) : void
      {
         var _loc3_:uint = var_31;
         var _loc4_:*;
         var_31 = !!param2 ? (_loc4_ = var_31 | param1, var_31 |= param1, uint(_loc4_)) : (_loc4_ = var_31 & ~param1, var_31 &= ~param1, uint(_loc4_));
         if(var_31 != _loc3_)
         {
            update(this,new WindowNotifyEvent(WindowNotifyEvent.const_395,this,null));
         }
      }
      
      public function removeEventListener(param1:String, param2:Function, param3:Boolean = false) : void
      {
         if(!_disposed)
         {
            _events.removeEventListener(param1,param2,param3);
         }
      }
      
      public function groupChildrenWithTag(param1:String, param2:Array, param3:Boolean = false) : uint
      {
         var _loc4_:* = null;
         var _loc5_:* = 0;
         for each(_loc4_ in _children)
         {
            if(_loc4_.tags.indexOf(param1) > -1)
            {
               param2.push(_loc4_);
               _loc5_++;
            }
            if(param3)
            {
               _loc5_ += _loc4_.groupChildrenWithTag(param1,param2,param3);
            }
         }
         return _loc5_;
      }
      
      public function enable() : Boolean
      {
         if(!getStateFlag(WindowState.const_51))
         {
            return true;
         }
         var _loc1_:WindowNotifyEvent = new WindowNotifyEvent(WindowNotifyEvent.const_853,this,null);
         update(this,_loc1_);
         if(_loc1_.isDefaultPrevented())
         {
            return false;
         }
         setStateFlag(WindowState.const_51,false);
         _loc1_.type = WindowNotifyEvent.const_651;
         update(this,_loc1_);
         return true;
      }
      
      public function set clipping(param1:Boolean) : void
      {
         var_1058 = param1;
         update(this,new WindowNotifyEvent(WindowNotifyEvent.const_347,this,null));
      }
      
      public function willTrigger(param1:String) : Boolean
      {
         return !!_disposed ? false : Boolean(_events.willTrigger(param1));
      }
      
      public function hitTestGlobalRectangle(param1:Rectangle) : Boolean
      {
         var _loc2_:Rectangle = new Rectangle();
         getGlobalRectangle(_loc2_);
         return _loc2_.intersects(param1);
      }
      
      public function hitTestLocalPoint(param1:Point) : Boolean
      {
         return var_5.containsPoint(param1);
      }
      
      public function set width(param1:int) : void
      {
         if(param1 != var_5.width)
         {
            setRectangle(var_5.x,var_5.y,param1,var_5.height);
         }
      }
      
      protected function forwardMouseEvent(param1:MouseEvent) : WindowEvent
      {
         var _loc6_:Boolean = false;
         var _loc2_:String = "null";
         var _loc5_:Point = new Point(param1.stageX,param1.stageY);
         convertPointFromGlobalToLocalSpace(_loc5_);
         _loc6_ = _loc5_.x > -1 && _loc5_.y > -1 && _loc5_.x < var_5.width && _loc5_.y < var_5.height;
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               _loc2_ = "null";
               break;
            case MouseEvent.MOUSE_MOVE:
               _loc2_ = "null";
               break;
            case MouseEvent.MOUSE_OUT:
               _loc2_ = "null";
               break;
            case MouseEvent.ROLL_OUT:
               _loc2_ = "null";
               break;
            case MouseEvent.ROLL_OVER:
               _loc2_ = "null";
               break;
            case MouseEvent.CLICK:
               _loc2_ = "null";
               break;
            case MouseEvent.DOUBLE_CLICK:
               _loc2_ = "null";
               break;
            case MouseEvent.MOUSE_DOWN:
               _loc2_ = "null";
               break;
            case MouseEvent.MOUSE_UP:
               _loc2_ = !!_loc6_ ? "null" : WindowMouseEvent.const_572;
               break;
            case MouseEvent.MOUSE_WHEEL:
               _loc2_ = "null";
         }
         var _loc7_:WindowEvent = new WindowMouseEvent(_loc2_,this,null,_loc5_.x,_loc5_.y,param1.stageX,param1.stageY,param1.altKey,param1.ctrlKey,param1.shiftKey,param1.buttonDown,param1.delta,false,true);
         procedure(_loc7_,this);
         if(!_loc7_.isWindowOperationPrevented())
         {
            dispatchEvent(_loc7_);
         }
         return _loc7_;
      }
      
      public function releaseGraphicsContext() : void
      {
         var_1002 = false;
         if(!var_14)
         {
         }
      }
      
      public function getChildUnderPoint(param1:Point) : IWindow
      {
         var _loc2_:* = null;
         var _loc3_:Boolean = false;
         var _loc4_:* = null;
         var _loc5_:* = 0;
         if(var_326)
         {
            _loc2_ = new Rectangle();
            getMouseRegion(_loc2_);
            _loc3_ = _loc2_.containsPoint(param1);
            _loc5_ = uint(numChildren);
            if(_loc3_)
            {
               while(_loc5_ > 0)
               {
                  _loc4_ = WindowController(_children[_loc5_ - 1]).getChildUnderPoint(param1);
                  if(_loc4_ != null)
                  {
                     return _loc4_;
                  }
                  _loc5_--;
               }
            }
            if(validateGlobalPointIntersection(param1,null))
            {
               return this;
            }
         }
         return null;
      }
      
      public function groupChildrenWithID(param1:uint, param2:Array, param3:Boolean = false) : uint
      {
         var _loc4_:* = null;
         var _loc5_:* = 0;
         for each(_loc4_ in _children)
         {
            if(_loc4_.id == param1)
            {
               param2.push(_loc4_);
               _loc5_++;
            }
            if(param3)
            {
               _loc5_ += _loc4_.groupChildrenWithID(param1,param2,param3);
            }
         }
         return _loc5_;
      }
      
      public function get numChildren() : int
      {
         return _children.length;
      }
      
      public function set procedure(param1:Function) : void
      {
         var_590 = param1;
      }
      
      public function get host() : IWindow
      {
         return var_6 == desktop ? {} : var_6.host;
      }
      
      public function buildFromXML(param1:XML, param2:Map = null) : Boolean
      {
         return _context.getWindowParser().parseAndConstruct(param1,this,param2) != null;
      }
      
      public function convertPointFromGlobalToLocalSpace(param1:Point) : void
      {
         var _loc2_:Number = param1.x;
         var _loc3_:Number = param1.y;
         if(var_6 == null)
         {
            param1.x = var_5.x;
            param1.y = var_5.y;
         }
         else
         {
            var_6.getGlobalPosition(param1);
            param1.x += var_5.x;
            param1.y += var_5.y;
         }
         param1.x = _loc2_ - param1.x;
         param1.y = _loc3_ - param1.y;
      }
      
      protected function cloneChildWindows(param1:WindowController) : void
      {
         var _loc2_:* = null;
         for each(_loc2_ in _children)
         {
            if(_loc2_.tags.indexOf(WindowController.EXCLUDE_CHILD_TAG) == -1)
            {
               param1.addChild(_loc2_.clone());
            }
         }
      }
      
      public function hitTestGlobalPoint(param1:Point) : Boolean
      {
         var _loc2_:Rectangle = new Rectangle();
         getGlobalRectangle(_loc2_);
         return _loc2_.containsPoint(param1);
      }
      
      public function getRelativeMousePosition(param1:Point) : void
      {
         getGlobalPosition(param1);
         param1.x = _context.getDesktopWindow().mouseX - param1.x;
         param1.y = _context.getDesktopWindow().mouseY - param1.y;
      }
      
      public function setRegionProperties(param1:Rectangle = null, param2:Rectangle = null, param3:Rectangle = null) : void
      {
         if(param3 != null)
         {
            if(param3.width < 0 || param3.height < 0)
            {
               throw new Error("Invalid rectangle; maximized size can\'t be less than zero!");
            }
            if(var_134 == null)
            {
               var_134 = new Rectangle();
            }
            var_134.x = param3.x;
            var_134.y = param3.y;
            var_134.width = param3.width;
            var_134.height = param3.height;
         }
         if(param2 != null)
         {
            if(param2.width < 0 || param2.height < 0)
            {
               throw new Error("Invalid rectangle; minimized size can\'t be less than zero!");
            }
            if(var_135 == null)
            {
               var_135 = new Rectangle();
            }
            var_135.x = param2.x;
            var_135.y = param2.y;
            var_135.width = param2.width;
            var_135.height = param2.height;
         }
         if(param3.width < param2.width || param3.height < param2.height)
         {
            param3.width = param2.width;
            param3.height = param2.height;
            throw new Error("Maximized rectangle can\'t be smaller than minimized rectangle!");
         }
         if(param1 != null)
         {
            setRectangle(param1.x,param1.y,param1.width,param1.height);
         }
      }
      
      public function set alphaTreshold(param1:uint) : void
      {
         var_713 = param1 > 255 ? 255 : uint(param1);
      }
      
      public function groupChildrenUnderPoint(param1:Point, param2:Array) : void
      {
         var _loc3_:* = null;
         if(var_326)
         {
            if(var_5.containsPoint(param1))
            {
               param2.push(this);
               param1.offset(0,0);
               for each(_loc3_ in _children)
               {
                  _loc3_.groupChildrenUnderPoint(param1,param2);
               }
               param1.offset(var_5.x,var_5.y);
            }
            else if(!var_1058)
            {
               param1.offset(0,0);
               for each(_loc3_ in _children)
               {
                  _loc3_.groupChildrenUnderPoint(param1,param2);
               }
               param1.offset(var_5.x,var_5.y);
            }
         }
      }
      
      public function set caption(param1:String) : void
      {
         param1 = !!param1 ? param1 : "";
         if(param1 != caption)
         {
            var_301 = param1;
            _context.invalidate(this,var_5,WindowRedrawFlag.const_52);
         }
      }
      
      public function unfocus() : Boolean
      {
         if(!getStateFlag(WindowState.const_53))
         {
            return true;
         }
         var _loc1_:WindowNotifyEvent = new WindowNotifyEvent(WindowNotifyEvent.const_993,this,null);
         update(this,_loc1_);
         if(_loc1_.isDefaultPrevented())
         {
            return false;
         }
         setStateFlag(WindowState.const_53,false);
         _loc1_.type = WindowNotifyEvent.const_935;
         update(this,_loc1_);
         return true;
      }
      
      public function resolve() : uint
      {
         return 0;
      }
      
      protected function forwardNormalEvent(param1:Event) : WindowEvent
      {
         var _loc2_:String = "null";
         switch(param1.type)
         {
            case Event.CHANGE:
               _loc2_ = "null";
         }
         var _loc4_:WindowEvent = new WindowEvent(_loc2_,this,null,false,true);
         procedure(_loc4_,this);
         if(!_loc4_.isWindowOperationPrevented())
         {
            dispatchEvent(_loc4_);
         }
         return _loc4_;
      }
      
      public function get alphaTreshold() : uint
      {
         return var_713;
      }
      
      public function close() : Boolean
      {
         if(!getStateFlag(WindowState.const_61))
         {
            return true;
         }
         var _loc1_:WindowNotifyEvent = new WindowNotifyEvent(WindowNotifyEvent.const_969,this,null);
         update(this,_loc1_);
         if(_loc1_.isDefaultPrevented())
         {
            return false;
         }
         visible = false;
         _loc1_.type = WindowNotifyEvent.const_877;
         update(this,_loc1_);
         return true;
      }
      
      public function destroy() : Boolean
      {
         if(var_31 == WindowState.const_350)
         {
            return true;
         }
         var_31 = WindowState.const_350;
         var _loc1_:WindowNotifyEvent = new WindowNotifyEvent(WindowNotifyEvent.const_952,this,null);
         update(this,_loc1_);
         if(_loc1_.isDefaultPrevented())
         {
            return false;
         }
         _loc1_.type = WindowNotifyEvent.const_817;
         update(this,_loc1_);
         dispose();
         return true;
      }
      
      public function get filters() : Array
      {
         return !!hasGraphicsContext() ? getGraphicContext(true).filters : [];
      }
      
      public function childRectToClippedDrawRegion(param1:Rectangle, param2:Rectangle) : Boolean
      {
         var _loc4_:* = null;
         var _loc3_:Boolean = false;
         if(testParamFlag(WindowParam.const_15))
         {
            param1.offset(var_5.x,var_5.y);
            if(clipping)
            {
               _loc4_ = param1.intersection(var_5);
               if(param1.x < var_5.x)
               {
                  param2.x -= param1.x - 0;
                  param1.x = var_5.x;
                  _loc3_ = true;
               }
               if(param1.y < var_5.y)
               {
                  param2.y -= param1.y - 0;
                  param1.y = var_5.y;
                  _loc3_ = true;
               }
               if(param1.width != _loc4_.width)
               {
                  param1.width = _loc4_.width;
                  _loc3_ = true;
               }
               if(param1.height != _loc4_.height)
               {
                  param1.height = _loc4_.height;
                  _loc3_ = true;
               }
               param2.width = _loc4_.width;
               param2.height = _loc4_.height;
            }
            if(var_6 != null)
            {
               _loc3_ = WindowController(var_6).childRectToClippedDrawRegion(param1,param2) || _loc3_;
            }
         }
         else if(clipping)
         {
            if(param1.x < 0)
            {
               param2.x -= param1.x;
               param1.x = 0;
               _loc3_ = true;
            }
            if(param1.y < 0)
            {
               param2.y -= param1.y;
               param1.y = 0;
               _loc3_ = true;
            }
            if(var_5.width < param1.right)
            {
               param2.right -= param1.right - 0;
               param1.right = param1.width;
               _loc3_ = true;
            }
            if(var_5.height < param1.bottom)
            {
               param2.bottom -= param1.bottom - 0;
               param1.bottom = var_5.height;
               _loc3_ = true;
            }
         }
         return !!_loc3_ ? param2.width > 0 && param2.height > 0 : true;
      }
      
      public function set filters(param1:Array) : void
      {
         if(hasGraphicsContext())
         {
            getGraphicContext(true).filters = param1;
         }
      }
      
      public function getLocalPosition(param1:Point) : void
      {
         param1.x = var_5.x;
         param1.y = var_5.y;
      }
   }
}
