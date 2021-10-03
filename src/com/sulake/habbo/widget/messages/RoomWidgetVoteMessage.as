package com.sulake.habbo.widget.messages
{
   public class RoomWidgetVoteMessage extends RoomWidgetMessage
   {
      
      public static const const_93:String = "RWVM_VOTE_MESSAGE";
       
      
      private var var_1243:int;
      
      public function RoomWidgetVoteMessage(param1:int)
      {
         super(const_93);
         var_1243 = param1;
      }
      
      public function get vote() : int
      {
         return var_1243;
      }
   }
}
