package com.sulake.habbo.communication.messages.parser.moderation
{
   import flash.utils.getTimer;
   
   public class IssueMessageData
   {
      
      public static const const_117:int = 1;
      
      public static const const_1117:int = 3;
      
      public static const const_346:int = 2;
       
      
      private var var_2144:int;
      
      private var var_2064:int;
      
      private var var_2142:int;
      
      private var var_1617:int;
      
      private var var_31:int;
      
      private var var_405:int;
      
      private var var_1173:int;
      
      private var var_2020:int;
      
      private var var_1018:int;
      
      private var _roomResources:String;
      
      private var var_2141:int;
      
      private var var_2143:int;
      
      private var var_2140:String;
      
      private var var_2019:String;
      
      private var var_2139:int = 0;
      
      private var var_1273:String;
      
      private var _message:String;
      
      private var var_1609:int;
      
      private var var_2146:String;
      
      private var var_1108:int;
      
      private var var_654:String;
      
      private var var_2145:String;
      
      private var var_1514:int;
      
      public function IssueMessageData()
      {
         super();
      }
      
      public function set reportedUserId(param1:int) : void
      {
         var_1018 = param1;
      }
      
      public function set temporalPriority(param1:int) : void
      {
         var_2139 = param1;
      }
      
      public function get reporterUserId() : int
      {
         return var_2143;
      }
      
      public function set roomName(param1:String) : void
      {
         var_654 = param1;
      }
      
      public function set chatRecordId(param1:int) : void
      {
         var_2141 = param1;
      }
      
      public function get state() : int
      {
         return var_31;
      }
      
      public function get roomResources() : String
      {
         return _roomResources;
      }
      
      public function set roomResources(param1:String) : void
      {
         _roomResources = param1;
      }
      
      public function get roomName() : String
      {
         return var_654;
      }
      
      public function get message() : String
      {
         return _message;
      }
      
      public function set worldId(param1:int) : void
      {
         var_1617 = param1;
      }
      
      public function set state(param1:int) : void
      {
         var_31 = param1;
      }
      
      public function get unitPort() : int
      {
         return var_2064;
      }
      
      public function get priority() : int
      {
         return var_2144 + var_2139;
      }
      
      public function set issueId(param1:int) : void
      {
         var_2020 = param1;
      }
      
      public function get pickerUserName() : String
      {
         return var_2019;
      }
      
      public function getOpenTime() : String
      {
         var _loc1_:int = (getTimer() - var_1514) / 1000;
         var _loc2_:int = _loc1_ % 60;
         var _loc3_:int = _loc1_ / 60;
         var _loc4_:int = _loc3_ % 60;
         var _loc5_:int = _loc3_ / 60;
         var _loc6_:String = _loc2_ < 10 ? "0" + _loc2_ : "" + _loc2_;
         var _loc7_:String = _loc4_ < 10 ? "0" + _loc4_ : "" + _loc4_;
         var _loc8_:String = _loc5_ < 10 ? "0" + _loc5_ : "" + _loc5_;
         return _loc8_ + ":" + _loc7_ + ":" + _loc6_;
      }
      
      public function get categoryId() : int
      {
         return var_1108;
      }
      
      public function set reporterUserId(param1:int) : void
      {
         var_2143 = param1;
      }
      
      public function get roomType() : int
      {
         return var_1173;
      }
      
      public function set flatType(param1:String) : void
      {
         var_2140 = param1;
      }
      
      public function get chatRecordId() : int
      {
         return var_2141;
      }
      
      public function set message(param1:String) : void
      {
         _message = param1;
      }
      
      public function get worldId() : int
      {
         return var_1617;
      }
      
      public function set flatOwnerName(param1:String) : void
      {
         var_2145 = param1;
      }
      
      public function set reportedUserName(param1:String) : void
      {
         var_1273 = param1;
      }
      
      public function get issueId() : int
      {
         return var_2020;
      }
      
      public function set priority(param1:int) : void
      {
         var_2144 = param1;
      }
      
      public function set unitPort(param1:int) : void
      {
         var_2064 = param1;
      }
      
      public function get flatType() : String
      {
         return var_2140;
      }
      
      public function set reportedCategoryId(param1:int) : void
      {
         var_2142 = param1;
      }
      
      public function set pickerUserName(param1:String) : void
      {
         var_2019 = param1;
      }
      
      public function set pickerUserId(param1:int) : void
      {
         var_1609 = param1;
      }
      
      public function get reportedUserName() : String
      {
         return var_1273;
      }
      
      public function set roomType(param1:int) : void
      {
         var_1173 = param1;
      }
      
      public function get reportedCategoryId() : int
      {
         return var_2142;
      }
      
      public function set flatId(param1:int) : void
      {
         var_405 = param1;
      }
      
      public function set categoryId(param1:int) : void
      {
         var_1108 = param1;
      }
      
      public function set timeStamp(param1:int) : void
      {
         var_1514 = param1;
      }
      
      public function get pickerUserId() : int
      {
         return var_1609;
      }
      
      public function set reporterUserName(param1:String) : void
      {
         var_2146 = param1;
      }
      
      public function get timeStamp() : int
      {
         return var_1514;
      }
      
      public function get reportedUserId() : int
      {
         return var_1018;
      }
      
      public function get flatId() : int
      {
         return var_405;
      }
      
      public function get flatOwnerName() : String
      {
         return var_2145;
      }
      
      public function get reporterUserName() : String
      {
         return var_2146;
      }
   }
}
