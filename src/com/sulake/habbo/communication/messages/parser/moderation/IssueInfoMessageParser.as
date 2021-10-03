package com.sulake.habbo.communication.messages.parser.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import flash.utils.getTimer;
   
   public class IssueInfoMessageParser implements IMessageParser
   {
       
      
      private var var_51:IssueMessageData;
      
      public function IssueInfoMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_51 = new IssueMessageData();
         var_51.issueId = param1.readInteger();
         var_51.state = param1.readInteger();
         var_51.categoryId = param1.readInteger();
         var_51.reportedCategoryId = param1.readInteger();
         var_51.timeStamp = getTimer() - param1.readInteger();
         var_51.priority = param1.readInteger();
         var_51.reporterUserId = param1.readInteger();
         var_51.reporterUserName = param1.readString();
         var_51.reportedUserId = param1.readInteger();
         var_51.reportedUserName = param1.readString();
         var_51.pickerUserId = param1.readInteger();
         var_51.pickerUserName = param1.readString();
         var_51.message = param1.readString();
         var_51.chatRecordId = param1.readInteger();
         var_51.roomName = param1.readString();
         var_51.roomType = param1.readInteger();
         if(false)
         {
            var_51.roomResources = param1.readString();
            var_51.unitPort = param1.readInteger();
            var_51.worldId = param1.readInteger();
         }
         if(false)
         {
            var_51.flatType = param1.readString();
            var_51.flatId = param1.readInteger();
            var_51.flatOwnerName = param1.readString();
         }
         return true;
      }
      
      public function get issueData() : IssueMessageData
      {
         return var_51;
      }
      
      public function flush() : Boolean
      {
         var_51 = null;
         return true;
      }
   }
}
