package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ModeratorUserInfoData
   {
       
      
      private var var_1870:int;
      
      private var var_1871:int;
      
      private var var_1872:int;
      
      private var _userName:String;
      
      private var var_1869:int;
      
      private var var_1867:int;
      
      private var var_1868:int;
      
      private var _userId:int;
      
      private var var_609:Boolean;
      
      public function ModeratorUserInfoData(param1:IMessageDataWrapper)
      {
         super();
         _userId = param1.readInteger();
         _userName = param1.readString();
         var_1867 = param1.readInteger();
         var_1869 = param1.readInteger();
         var_609 = param1.readBoolean();
         var_1872 = param1.readInteger();
         var_1871 = param1.readInteger();
         var_1870 = param1.readInteger();
         var_1868 = param1.readInteger();
      }
      
      public function get banCount() : int
      {
         return var_1868;
      }
      
      public function get userId() : int
      {
         return _userId;
      }
      
      public function get online() : Boolean
      {
         return var_609;
      }
      
      public function get minutesSinceLastLogin() : int
      {
         return var_1869;
      }
      
      public function get abusiveCfhCount() : int
      {
         return var_1871;
      }
      
      public function get cautionCount() : int
      {
         return var_1870;
      }
      
      public function get cfhCount() : int
      {
         return var_1872;
      }
      
      public function get minutesSinceRegistration() : int
      {
         return var_1867;
      }
      
      public function get userName() : String
      {
         return _userName;
      }
   }
}
