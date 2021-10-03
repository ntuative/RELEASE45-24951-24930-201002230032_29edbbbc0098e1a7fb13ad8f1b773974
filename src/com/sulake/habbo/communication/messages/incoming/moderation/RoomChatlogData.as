package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class RoomChatlogData
   {
       
      
      private var var_654:String;
      
      private var var_1414:Array;
      
      private var var_1415:Boolean;
      
      private var _roomId:int;
      
      public function RoomChatlogData(param1:IMessageDataWrapper)
      {
         var_1414 = new Array();
         super();
         var_1415 = param1.readBoolean();
         _roomId = param1.readInteger();
         var_654 = param1.readString();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            var_1414.push(new ChatlineData(param1));
            _loc3_++;
         }
         Logger.log("READ ROOMCHATLOGDATA: " + var_1415 + ", " + _roomId + ", " + var_654 + ", " + chatlog.length);
      }
      
      public function get isPublic() : Boolean
      {
         return var_1415;
      }
      
      public function get roomName() : String
      {
         return var_654;
      }
      
      public function get chatlog() : Array
      {
         return var_1414;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
   }
}
