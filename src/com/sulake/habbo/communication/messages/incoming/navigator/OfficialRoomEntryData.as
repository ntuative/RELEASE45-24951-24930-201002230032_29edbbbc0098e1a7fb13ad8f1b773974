package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class OfficialRoomEntryData implements IDisposable
   {
      
      public static const const_1354:int = 4;
      
      public static const const_659:int = 3;
      
      public static const const_564:int = 2;
      
      public static const const_773:int = 1;
       
      
      private var var_2153:String;
      
      private var _disposed:Boolean;
      
      private var var_1576:int;
      
      private var var_2154:Boolean;
      
      private var var_798:String;
      
      private var var_863:PublicRoomData;
      
      private var var_2152:int;
      
      private var _index:int;
      
      private var var_2155:String;
      
      private var _type:int;
      
      private var var_1592:String;
      
      private var var_862:GuestRoomData;
      
      private var var_2156:String;
      
      private var _open:Boolean;
      
      public function OfficialRoomEntryData(param1:IMessageDataWrapper)
      {
         super();
         _index = param1.readInteger();
         var_2153 = param1.readString();
         var_2156 = param1.readString();
         var_2154 = param1.readInteger() == 1;
         var_2155 = param1.readString();
         var_798 = param1.readString();
         var_2152 = param1.readInteger();
         var_1576 = param1.readInteger();
         _type = param1.readInteger();
         if(_type == const_773)
         {
            var_1592 = param1.readString();
         }
         else if(_type == const_659)
         {
            var_863 = new PublicRoomData(param1);
         }
         else if(_type == const_564)
         {
            var_862 = new GuestRoomData(param1);
         }
      }
      
      public function get folderId() : int
      {
         return var_2152;
      }
      
      public function get popupCaption() : String
      {
         return var_2153;
      }
      
      public function get userCount() : int
      {
         return var_1576;
      }
      
      public function get open() : Boolean
      {
         return _open;
      }
      
      public function get showDetails() : Boolean
      {
         return var_2154;
      }
      
      public function get maxUsers() : int
      {
         if(this.type == const_773)
         {
            return 0;
         }
         if(this.type == const_564)
         {
            return this.var_862.maxUserCount;
         }
         if(this.type == const_659)
         {
            return this.var_863.maxUsers;
         }
         return 0;
      }
      
      public function get popupDesc() : String
      {
         return var_2156;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         if(this.var_862 != null)
         {
            this.var_862.dispose();
            this.var_862 = null;
         }
         if(this.var_863 != null)
         {
            this.var_863.dispose();
            this.var_863 = null;
         }
      }
      
      public function get index() : int
      {
         return _index;
      }
      
      public function get guestRoomData() : GuestRoomData
      {
         return var_862;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get picText() : String
      {
         return var_2155;
      }
      
      public function get publicRoomData() : PublicRoomData
      {
         return var_863;
      }
      
      public function get picRef() : String
      {
         return var_798;
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function get tag() : String
      {
         return var_1592;
      }
      
      public function toggleOpen() : void
      {
         _open = !_open;
      }
   }
}
