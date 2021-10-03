package com.sulake.habbo.communication.messages.parser.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.moderation.OffenceCategoryData;
   
   public class ModeratorInitMessageParser implements IMessageParser
   {
       
      
      private var _roomMessageTemplates:Array;
      
      private var var_2011:Boolean;
      
      private var var_1484:Array;
      
      private var var_2017:Boolean;
      
      private var var_2016:Boolean;
      
      private var var_2014:Boolean;
      
      private var var_136:Array;
      
      private var var_2010:Boolean;
      
      private var var_2012:Boolean;
      
      private var var_1485:Array;
      
      private var var_2013:Boolean;
      
      private var var_2015:Boolean;
      
      public function ModeratorInitMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get banPermission() : Boolean
      {
         return var_2015;
      }
      
      public function get roomKickPermission() : Boolean
      {
         return var_2011;
      }
      
      public function get alertPermission() : Boolean
      {
         return var_2017;
      }
      
      public function get cfhPermission() : Boolean
      {
         return var_2010;
      }
      
      public function get roomMessageTemplates() : Array
      {
         return _roomMessageTemplates;
      }
      
      public function get roomAlertPermission() : Boolean
      {
         return var_2012;
      }
      
      public function get messageTemplates() : Array
      {
         return var_1484;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc2_:IssueInfoMessageParser = new IssueInfoMessageParser();
         var_136 = [];
         var_1484 = [];
         _roomMessageTemplates = [];
         var_1485 = [];
         var _loc3_:int = param1.readInteger();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            if(!_loc2_.parse(param1))
            {
               return false;
            }
            var_136.push(_loc2_.issueData);
            _loc4_++;
         }
         _loc3_ = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            var_1484.push(param1.readString());
            _loc4_++;
         }
         _loc3_ = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            var_1485.push(new OffenceCategoryData(param1));
            _loc4_++;
         }
         var_2010 = param1.readBoolean();
         var_2014 = param1.readBoolean();
         var_2017 = param1.readBoolean();
         var_2016 = param1.readBoolean();
         var_2015 = param1.readBoolean();
         var_2012 = param1.readBoolean();
         var_2011 = param1.readBoolean();
         _loc3_ = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _roomMessageTemplates.push(param1.readString());
            _loc4_++;
         }
         var_2013 = param1.readBoolean();
         return true;
      }
      
      public function get kickPermission() : Boolean
      {
         return var_2016;
      }
      
      public function get offenceCategories() : Array
      {
         return var_1485;
      }
      
      public function get issues() : Array
      {
         return var_136;
      }
      
      public function get bobbaFilterPermission() : Boolean
      {
         return var_2013;
      }
      
      public function get chatlogsPermission() : Boolean
      {
         return var_2014;
      }
   }
}
