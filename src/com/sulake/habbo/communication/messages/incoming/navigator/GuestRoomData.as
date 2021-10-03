package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class GuestRoomData implements IDisposable
   {
       
      
      private var _disposed:Boolean;
      
      private var var_1576:int;
      
      private var var_1578:String;
      
      private var var_1579:int;
      
      private var var_1580:int;
      
      private var var_605:Boolean;
      
      private var var_1582:Boolean;
      
      private var var_405:int;
      
      private var var_1085:String;
      
      private var var_1577:int;
      
      private var var_1108:int;
      
      private var _ownerName:String;
      
      private var var_654:String;
      
      private var var_1584:int;
      
      private var var_1583:RoomThumbnailData;
      
      private var var_1581:Boolean;
      
      private var var_589:Array;
      
      public function GuestRoomData(param1:IMessageDataWrapper)
      {
         var _loc4_:* = null;
         var_589 = new Array();
         super();
         var_405 = param1.readInteger();
         var_605 = param1.readBoolean();
         var_654 = param1.readString();
         _ownerName = param1.readString();
         var_1577 = param1.readInteger();
         var_1576 = param1.readInteger();
         var_1584 = param1.readInteger();
         var_1085 = param1.readString();
         var_1579 = param1.readInteger();
         var_1581 = param1.readBoolean();
         var_1580 = param1.readInteger();
         var_1108 = param1.readInteger();
         var_1578 = param1.readString();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = param1.readString();
            var_589.push(_loc4_);
            _loc3_++;
         }
         var_1583 = new RoomThumbnailData(param1);
         var_1582 = param1.readBoolean();
      }
      
      public function get maxUserCount() : int
      {
         return var_1584;
      }
      
      public function get roomName() : String
      {
         return var_654;
      }
      
      public function get userCount() : int
      {
         return var_1576;
      }
      
      public function get score() : int
      {
         return var_1580;
      }
      
      public function get eventCreationTime() : String
      {
         return var_1578;
      }
      
      public function get allowTrading() : Boolean
      {
         return var_1581;
      }
      
      public function get tags() : Array
      {
         return var_589;
      }
      
      public function get allowPets() : Boolean
      {
         return var_1582;
      }
      
      public function get event() : Boolean
      {
         return var_605;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         this.var_589 = null;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get categoryId() : int
      {
         return var_1108;
      }
      
      public function get srchSpecPrm() : int
      {
         return var_1579;
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function get thumbnail() : RoomThumbnailData
      {
         return var_1583;
      }
      
      public function get doorMode() : int
      {
         return var_1577;
      }
      
      public function get flatId() : int
      {
         return var_405;
      }
      
      public function get description() : String
      {
         return var_1085;
      }
   }
}
