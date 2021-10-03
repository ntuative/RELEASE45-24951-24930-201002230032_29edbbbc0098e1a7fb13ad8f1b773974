package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FriendData
   {
       
      
      private var var_545:String;
      
      private var var_1105:String;
      
      private var var_1107:String;
      
      private var var_1108:int;
      
      private var _gender:int;
      
      private var var_1109:String;
      
      private var _name:String;
      
      private var var_1106:Boolean;
      
      private var var_609:Boolean;
      
      private var _id:int;
      
      public function FriendData(param1:IMessageDataWrapper)
      {
         super();
         this._id = param1.readInteger();
         this._name = param1.readString();
         this._gender = param1.readInteger();
         this.var_609 = param1.readBoolean();
         this.var_1106 = param1.readBoolean();
         this.var_545 = param1.readString();
         this.var_1108 = param1.readInteger();
         this.var_1107 = param1.readString();
         this.var_1105 = param1.readString();
         this.var_1109 = param1.readString();
      }
      
      public function get gender() : int
      {
         return _gender;
      }
      
      public function get realName() : String
      {
         return var_1109;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get motto() : String
      {
         return var_1107;
      }
      
      public function get categoryId() : int
      {
         return var_1108;
      }
      
      public function get online() : Boolean
      {
         return var_609;
      }
      
      public function get followingAllowed() : Boolean
      {
         return var_1106;
      }
      
      public function get lastAccess() : String
      {
         return var_1105;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get figure() : String
      {
         return var_545;
      }
   }
}
