package com.sulake.habbo.communication.messages.parser.room.engine
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   
   public class RoomEntryInfoMessageParser implements IMessageParser
   {
       
      
      private var var_2097:int;
      
      private var var_404:Boolean;
      
      private var var_2096:Boolean;
      
      private var var_851:PublicRoomShortData;
      
      public function RoomEntryInfoMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_2096 = param1.readBoolean();
         if(var_2096)
         {
            var_2097 = param1.readInteger();
            var_404 = param1.readBoolean();
         }
         else
         {
            var_851 = new PublicRoomShortData(param1);
         }
         return true;
      }
      
      public function flush() : Boolean
      {
         if(var_851 != null)
         {
            var_851.dispose();
            var_851 = null;
         }
         return true;
      }
      
      public function get guestRoomId() : int
      {
         return var_2097;
      }
      
      public function get owner() : Boolean
      {
         return var_404;
      }
      
      public function get guestRoom() : Boolean
      {
         return var_2096;
      }
      
      public function get publicSpace() : PublicRoomShortData
      {
         return var_851;
      }
   }
}
