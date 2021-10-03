package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   import flash.events.Event;
   
   public class WindowEvent extends Event
   {
      
      public static const const_274:String = "WE_CHILD_RESIZED";
      
      public static const const_1233:String = "WE_CLOSE";
      
      public static const const_1273:String = "WE_DESTROY";
      
      public static const const_121:String = "WE_CHANGE";
      
      public static const const_1260:String = "WE_RESIZE";
      
      public static const WINDOW_EVENT_MESSAGE:String = "WE_MESSAGE";
      
      public static const const_1436:String = "WE_PARENT_RESIZE";
      
      public static const const_69:String = "WE_UPDATE";
      
      public static const const_1248:String = "WE_MAXIMIZE";
      
      public static const const_427:String = "WE_DESTROYED";
      
      public static const const_973:String = "WE_UNSELECT";
      
      public static const const_1228:String = "WE_MAXIMIZED";
      
      public static const const_1420:String = "WE_UNLOCKED";
      
      public static const const_393:String = "WE_CHILD_REMOVED";
      
      public static const const_155:String = "WE_OK";
      
      public static const const_26:String = "WE_RESIZED";
      
      public static const const_1232:String = "WE_ACTIVATE";
      
      public static const const_232:String = "WE_ENABLED";
      
      public static const const_379:String = "WE_CHILD_RELOCATED";
      
      public static const const_1141:String = "WE_CREATE";
      
      public static const const_532:String = "WE_SELECT";
      
      public static const const_160:String = "";
      
      public static const const_1428:String = "WE_LOCKED";
      
      public static const const_1545:String = "WE_PARENT_RELOCATE";
      
      public static const const_1585:String = "WE_CHILD_REMOVE";
      
      public static const const_1461:String = "WE_CHILD_RELOCATE";
      
      public static const const_1457:String = "WE_LOCK";
      
      public static const const_181:String = "WE_FOCUSED";
      
      public static const const_571:String = "WE_UNSELECTED";
      
      public static const const_809:String = "WE_DEACTIVATED";
      
      public static const const_1231:String = "WE_MINIMIZED";
      
      public static const const_1452:String = "WE_ARRANGED";
      
      public static const const_1423:String = "WE_UNLOCK";
      
      public static const const_1581:String = "WE_ATTACH";
      
      public static const const_1348:String = "WE_OPEN";
      
      public static const const_1243:String = "WE_RESTORE";
      
      public static const const_1538:String = "WE_PARENT_RELOCATED";
      
      public static const const_1312:String = "WE_RELOCATE";
      
      public static const const_1502:String = "WE_CHILD_RESIZE";
      
      public static const const_1565:String = "WE_ARRANGE";
      
      public static const const_1298:String = "WE_OPENED";
      
      public static const const_1269:String = "WE_CLOSED";
      
      public static const const_1442:String = "WE_DETACHED";
      
      public static const const_1439:String = "WE_UPDATED";
      
      public static const const_1346:String = "WE_UNFOCUSED";
      
      public static const const_384:String = "WE_RELOCATED";
      
      public static const const_1300:String = "WE_DEACTIVATE";
      
      public static const const_171:String = "WE_DISABLED";
      
      public static const const_680:String = "WE_CANCEL";
      
      public static const const_565:String = "WE_ENABLE";
      
      public static const const_1357:String = "WE_ACTIVATED";
      
      public static const const_1235:String = "WE_FOCUS";
      
      public static const const_1467:String = "WE_DETACH";
      
      public static const const_1134:String = "WE_RESTORED";
      
      public static const const_1144:String = "WE_UNFOCUS";
      
      public static const const_36:String = "WE_SELECTED";
      
      public static const const_1130:String = "WE_PARENT_RESIZED";
      
      public static const const_1334:String = "WE_CREATED";
      
      public static const const_1578:String = "WE_ATTACHED";
      
      public static const const_1131:String = "WE_MINIMIZE";
      
      public static const WINDOW_EVENT_DISABLE:String = "WE_DISABLE";
       
      
      protected var _type:String = "";
      
      protected var var_1562:IWindow;
      
      protected var _window:IWindow;
      
      protected var var_1337:Boolean;
      
      public function WindowEvent(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false, param5:Boolean = false)
      {
         _type = param1;
         _window = param2;
         var_1562 = param3;
         var_1337 = false;
         super(param1,param4,param5);
      }
      
      public function isWindowOperationPrevented() : Boolean
      {
         return var_1337;
      }
      
      public function get related() : IWindow
      {
         return var_1562;
      }
      
      public function get window() : IWindow
      {
         return _window;
      }
      
      public function set type(param1:String) : void
      {
         _type = param1;
      }
      
      override public function get type() : String
      {
         return _type;
      }
      
      override public function toString() : String
      {
         return formatToString("WindowEvent","type","bubbles","cancelable","window");
      }
      
      override public function clone() : Event
      {
         return new WindowEvent(_type,window,related,bubbles,cancelable);
      }
      
      public function preventWindowOperation() : void
      {
         if(cancelable)
         {
            var_1337 = true;
            stopImmediatePropagation();
            return;
         }
         throw new Error("Attempted to prevent window operation that is not canceable!");
      }
   }
}
