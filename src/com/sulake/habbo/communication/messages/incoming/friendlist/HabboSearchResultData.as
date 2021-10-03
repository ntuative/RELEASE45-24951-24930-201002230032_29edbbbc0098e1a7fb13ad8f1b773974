package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class HabboSearchResultData
   {
       
      
      private var var_2280:Boolean;
      
      private var var_2279:int;
      
      private var var_2278:Boolean;
      
      private var var_1357:String;
      
      private var var_1109:String;
      
      private var var_2199:int;
      
      private var var_1628:String;
      
      private var var_2277:String;
      
      private var var_1627:String;
      
      public function HabboSearchResultData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2199 = param1.readInteger();
         this.var_1357 = param1.readString();
         this.var_1628 = param1.readString();
         this.var_2280 = param1.readBoolean();
         this.var_2278 = param1.readBoolean();
         param1.readString();
         this.var_2279 = param1.readInteger();
         this.var_1627 = param1.readString();
         this.var_2277 = param1.readString();
         this.var_1109 = param1.readString();
      }
      
      public function get realName() : String
      {
         return this.var_1109;
      }
      
      public function get avatarName() : String
      {
         return this.var_1357;
      }
      
      public function get avatarId() : int
      {
         return this.var_2199;
      }
      
      public function get isAvatarOnline() : Boolean
      {
         return this.var_2280;
      }
      
      public function get lastOnlineDate() : String
      {
         return this.var_2277;
      }
      
      public function get avatarFigure() : String
      {
         return this.var_1627;
      }
      
      public function get canFollow() : Boolean
      {
         return this.var_2278;
      }
      
      public function get avatarMotto() : String
      {
         return this.var_1628;
      }
      
      public function get avatarGender() : int
      {
         return this.var_2279;
      }
   }
}
