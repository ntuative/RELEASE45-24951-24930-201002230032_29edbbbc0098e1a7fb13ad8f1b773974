package com.sulake.habbo.widget.messages
{
   public class RoomWidgetChatTypingMessage extends RoomWidgetMessage
   {
      
      public static const const_688:String = "RWCTM_TYPING_STATUS";
       
      
      private var var_434:Boolean;
      
      public function RoomWidgetChatTypingMessage(param1:Boolean)
      {
         super(const_688);
         var_434 = param1;
      }
      
      public function get isTyping() : Boolean
      {
         return var_434;
      }
   }
}
