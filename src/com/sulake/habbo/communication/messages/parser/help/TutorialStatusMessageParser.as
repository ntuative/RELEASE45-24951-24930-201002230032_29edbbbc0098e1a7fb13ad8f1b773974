package com.sulake.habbo.communication.messages.parser.help
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class TutorialStatusMessageParser implements IMessageParser
   {
       
      
      private var var_956:Boolean;
      
      private var var_955:Boolean;
      
      private var var_957:Boolean;
      
      public function TutorialStatusMessageParser()
      {
         super();
      }
      
      public function get hasCalledGuideBot() : Boolean
      {
         return var_956;
      }
      
      public function get hasChangedName() : Boolean
      {
         return var_955;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_957 = param1.readBoolean();
         var_955 = param1.readBoolean();
         var_956 = param1.readBoolean();
         return true;
      }
      
      public function get hasChangedLooks() : Boolean
      {
         return var_957;
      }
      
      public function flush() : Boolean
      {
         var_957 = false;
         var_955 = false;
         var_956 = false;
         return true;
      }
   }
}
