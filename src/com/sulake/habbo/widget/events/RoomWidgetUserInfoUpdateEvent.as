package com.sulake.habbo.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetUserInfoUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_194:String = "RWUIUE_PEER";
      
      public static const const_182:String = "RWUIUE_OWN_USER";
      
      public static const TRADE_REASON_NO_OWN_RIGHT:int = 1;
      
      public static const BOT:String = "RWUIUE_BOT";
      
      public static const const_1151:String = "BOT";
      
      public static const const_902:int = 2;
      
      public static const const_1303:int = 0;
      
      public static const const_800:int = 3;
       
      
      private var var_1107:String = "";
      
      private var var_2160:Boolean = false;
      
      private var var_1634:int = 0;
      
      private var var_2000:int = 0;
      
      private var var_2164:Boolean = false;
      
      private var var_1109:String = "";
      
      private var var_2163:Boolean = false;
      
      private var var_867:int = 0;
      
      private var var_2165:Boolean = true;
      
      private var var_1003:int = 0;
      
      private var var_2159:Boolean = false;
      
      private var var_1160:Boolean = false;
      
      private var var_2161:Boolean = false;
      
      private var var_1998:int = 0;
      
      private var var_2162:Boolean = false;
      
      private var _image:BitmapData = null;
      
      private var var_263:Array;
      
      private var var_1157:Boolean = false;
      
      private var _name:String = "";
      
      private var var_1633:int = 0;
      
      private var var_2157:Boolean = false;
      
      private var var_2158:int = 0;
      
      private var var_1999:String = "";
      
      public function RoomWidgetUserInfoUpdateEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         var_263 = [];
         super(param1,param2,param3);
      }
      
      public function get userRoomId() : int
      {
         return var_2000;
      }
      
      public function set userRoomId(param1:int) : void
      {
         var_2000 = param1;
      }
      
      public function get canBeAskedAsFriend() : Boolean
      {
         return var_2160;
      }
      
      public function get canBeKicked() : Boolean
      {
         return var_2165;
      }
      
      public function set canBeKicked(param1:Boolean) : void
      {
         var_2165 = param1;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function set amIAnyRoomController(param1:Boolean) : void
      {
         var_2163 = param1;
      }
      
      public function get motto() : String
      {
         return var_1107;
      }
      
      public function set isIgnored(param1:Boolean) : void
      {
         var_2159 = param1;
      }
      
      public function get isRoomOwner() : Boolean
      {
         return var_1160;
      }
      
      public function set name(param1:String) : void
      {
         _name = param1;
      }
      
      public function set motto(param1:String) : void
      {
         var_1107 = param1;
      }
      
      public function get amIOwner() : Boolean
      {
         return var_2157;
      }
      
      public function get groupBadgeId() : String
      {
         return var_1999;
      }
      
      public function set isRoomOwner(param1:Boolean) : void
      {
         var_1160 = param1;
      }
      
      public function get hasFlatControl() : Boolean
      {
         return var_2162;
      }
      
      public function set carryItem(param1:int) : void
      {
         var_1998 = param1;
      }
      
      public function get badges() : Array
      {
         return var_263;
      }
      
      public function get amIController() : Boolean
      {
         return var_2164;
      }
      
      public function set amIController(param1:Boolean) : void
      {
         var_2164 = param1;
      }
      
      public function set amIOwner(param1:Boolean) : void
      {
         var_2157 = param1;
      }
      
      public function set image(param1:BitmapData) : void
      {
         _image = param1;
      }
      
      public function set canTradeReason(param1:int) : void
      {
         var_2158 = param1;
      }
      
      public function set groupBadgeId(param1:String) : void
      {
         var_1999 = param1;
      }
      
      public function set realName(param1:String) : void
      {
         var_1109 = param1;
      }
      
      public function get amIAnyRoomController() : Boolean
      {
         return var_2163;
      }
      
      public function get isIgnored() : Boolean
      {
         return var_2159;
      }
      
      public function get carryItem() : int
      {
         return var_1998;
      }
      
      public function get isSpectatorMode() : Boolean
      {
         return var_1157;
      }
      
      public function set isSpectatorMode(param1:Boolean) : void
      {
         var_1157 = param1;
      }
      
      public function set respectLeft(param1:int) : void
      {
         var_867 = param1;
      }
      
      public function get image() : BitmapData
      {
         return _image;
      }
      
      public function get canTradeReason() : int
      {
         return var_2158;
      }
      
      public function get realName() : String
      {
         return var_1109;
      }
      
      public function set webID(param1:int) : void
      {
         var_1633 = param1;
      }
      
      public function set badges(param1:Array) : void
      {
         var_263 = param1;
      }
      
      public function set canTrade(param1:Boolean) : void
      {
         var_2161 = param1;
      }
      
      public function set hasFlatControl(param1:Boolean) : void
      {
         var_2162 = param1;
      }
      
      public function get respectLeft() : int
      {
         return var_867;
      }
      
      public function get webID() : int
      {
         return var_1633;
      }
      
      public function set groupId(param1:int) : void
      {
         var_1003 = param1;
      }
      
      public function get xp() : int
      {
         return var_1634;
      }
      
      public function set canBeAskedAsFriend(param1:Boolean) : void
      {
         var_2160 = param1;
      }
      
      public function get groupId() : int
      {
         return var_1003;
      }
      
      public function get canTrade() : Boolean
      {
         return var_2161;
      }
      
      public function set xp(param1:int) : void
      {
         var_1634 = param1;
      }
   }
}
