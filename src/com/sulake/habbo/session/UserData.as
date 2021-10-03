package com.sulake.habbo.session
{
   public class UserData implements IUserData
   {
       
      
      private var var_545:String = "";
      
      private var var_1635:String = "";
      
      private var var_1636:int = 0;
      
      private var var_1634:int = 0;
      
      private var _type:int = 0;
      
      private var var_1632:String = "";
      
      private var var_1179:String = "";
      
      private var _id:int = -1;
      
      private var _name:String = "";
      
      private var var_1633:int = 0;
      
      public function UserData(param1:int)
      {
         super();
         _id = param1;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function set name(param1:String) : void
      {
         _name = param1;
      }
      
      public function set groupStatus(param1:int) : void
      {
         var_1636 = param1;
      }
      
      public function set groupID(param1:String) : void
      {
         var_1632 = param1;
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function set figure(param1:String) : void
      {
         var_545 = param1;
      }
      
      public function set sex(param1:String) : void
      {
         var_1179 = param1;
      }
      
      public function get groupStatus() : int
      {
         return var_1636;
      }
      
      public function set webID(param1:int) : void
      {
         var_1633 = param1;
      }
      
      public function get groupID() : String
      {
         return var_1632;
      }
      
      public function set custom(param1:String) : void
      {
         var_1635 = param1;
      }
      
      public function get figure() : String
      {
         return var_545;
      }
      
      public function get sex() : String
      {
         return var_1179;
      }
      
      public function get custom() : String
      {
         return var_1635;
      }
      
      public function get webID() : int
      {
         return var_1633;
      }
      
      public function set xp(param1:int) : void
      {
         var_1634 = param1;
      }
      
      public function set type(param1:int) : void
      {
         _type = param1;
      }
      
      public function get xp() : int
      {
         return var_1634;
      }
   }
}
