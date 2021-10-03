package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   import flash.events.Event;
   
   public class WindowNotifyEvent extends WindowEvent
   {
      
      public static const const_1193:String = "WN_CREATED";
      
      public static const const_799:String = "WN_DISABLE";
      
      public static const const_782:String = "WN_DEACTIVATED";
      
      public static const const_813:String = "WN_OPENED";
      
      public static const const_877:String = "WN_CLOSED";
      
      public static const const_952:String = "WN_DESTROY";
      
      public static const const_1483:String = "WN_ARRANGED";
      
      public static const const_409:String = "WN_PARENT_RESIZED";
      
      public static const const_853:String = "WN_ENABLE";
      
      public static const const_985:String = "WN_RELOCATE";
      
      public static const const_869:String = "WN_FOCUS";
      
      public static const const_899:String = "WN_PARENT_RELOCATED";
      
      public static const const_347:String = "WN_PARAM_UPDATED";
      
      public static const const_583:String = "WN_PARENT_ACTIVATED";
      
      public static const const_209:String = "WN_RESIZED";
      
      public static const const_969:String = "WN_CLOSE";
      
      public static const const_992:String = "WN_PARENT_REMOVED";
      
      public static const const_230:String = "WN_CHILD_RELOCATED";
      
      public static const const_651:String = "WN_ENABLED";
      
      public static const const_243:String = "WN_CHILD_RESIZED";
      
      public static const const_770:String = "WN_MINIMIZED";
      
      public static const const_561:String = "WN_DISABLED";
      
      public static const const_174:String = "WN_CHILD_ACTIVATED";
      
      public static const const_395:String = "WN_STATE_UPDATED";
      
      public static const const_559:String = "WN_UNSELECTED";
      
      public static const const_394:String = "WN_STYLE_UPDATED";
      
      public static const const_1474:String = "WN_UPDATE";
      
      public static const const_360:String = "WN_PARENT_ADDED";
      
      public static const const_500:String = "WN_RESIZE";
      
      public static const const_590:String = "WN_CHILD_REMOVED";
      
      public static const const_1491:String = "";
      
      public static const const_944:String = "WN_RESTORED";
      
      public static const const_317:String = "WN_SELECTED";
      
      public static const const_894:String = "WN_MINIMIZE";
      
      public static const const_830:String = "WN_FOCUSED";
      
      public static const const_1209:String = "WN_LOCK";
      
      public static const const_298:String = "WN_CHILD_ADDED";
      
      public static const const_935:String = "WN_UNFOCUSED";
      
      public static const const_458:String = "WN_RELOCATED";
      
      public static const const_951:String = "WN_DEACTIVATE";
      
      public static const const_1118:String = "WN_CRETAE";
      
      public static const const_949:String = "WN_RESTORE";
      
      public static const const_267:String = "WN_ACTVATED";
      
      public static const const_1258:String = "WN_LOCKED";
      
      public static const const_373:String = "WN_SELECT";
      
      public static const const_863:String = "WN_MAXIMIZE";
      
      public static const const_876:String = "WN_OPEN";
      
      public static const const_672:String = "WN_UNSELECT";
      
      public static const const_1424:String = "WN_ARRANGE";
      
      public static const const_1172:String = "WN_UNLOCKED";
      
      public static const const_1576:String = "WN_UPDATED";
      
      public static const const_909:String = "WN_ACTIVATE";
      
      public static const const_1127:String = "WN_UNLOCK";
      
      public static const const_871:String = "WN_MAXIMIZED";
      
      public static const const_817:String = "WN_DESTROYED";
      
      public static const const_993:String = "WN_UNFOCUS";
       
      
      public function WindowNotifyEvent(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false)
      {
         super(param1,param2,param3,false,param4);
      }
      
      override public function toString() : String
      {
         return formatToString("WindowNotifyEvent","type","cancelable");
      }
      
      override public function clone() : Event
      {
         return new WindowNotifyEvent(type,_window,var_1562,cancelable);
      }
   }
}
