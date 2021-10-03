package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class UserMessageData
   {
      
      public static const const_1220:String = "F";
      
      public static const const_990:String = "M";
       
      
      private var var_74:Number = 0;
      
      private var var_545:String = "";
      
      private var var_1650:int = 0;
      
      private var var_1635:String = "";
      
      private var var_1636:int = 0;
      
      private var var_1634:int = 0;
      
      private var var_1632:String = "";
      
      private var var_1179:String = "";
      
      private var _id:int = 0;
      
      private var var_175:Boolean = false;
      
      private var var_203:int = 0;
      
      private var var_1651:String = "";
      
      private var _name:String = "";
      
      private var var_1633:int = 0;
      
      private var _y:Number = 0;
      
      private var var_75:Number = 0;
      
      public function UserMessageData(param1:int)
      {
         super();
         _id = param1;
      }
      
      public function get z() : Number
      {
         return var_75;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get dir() : int
      {
         return var_203;
      }
      
      public function set dir(param1:int) : void
      {
         if(!var_175)
         {
            var_203 = param1;
         }
      }
      
      public function set name(param1:String) : void
      {
         if(!var_175)
         {
            _name = param1;
         }
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get userType() : int
      {
         return var_1650;
      }
      
      public function set groupStatus(param1:int) : void
      {
         if(!var_175)
         {
            var_1636 = param1;
         }
      }
      
      public function get subType() : String
      {
         return var_1651;
      }
      
      public function set groupID(param1:String) : void
      {
         if(!var_175)
         {
            var_1632 = param1;
         }
      }
      
      public function set subType(param1:String) : void
      {
         if(!var_175)
         {
            var_1651 = param1;
         }
      }
      
      public function set xp(param1:int) : void
      {
         if(!var_175)
         {
            var_1634 = param1;
         }
      }
      
      public function set figure(param1:String) : void
      {
         if(!var_175)
         {
            var_545 = param1;
         }
      }
      
      public function set userType(param1:int) : void
      {
         if(!var_175)
         {
            var_1650 = param1;
         }
      }
      
      public function set sex(param1:String) : void
      {
         if(!var_175)
         {
            var_1179 = param1;
         }
      }
      
      public function get groupStatus() : int
      {
         return var_1636;
      }
      
      public function get groupID() : String
      {
         return var_1632;
      }
      
      public function set webID(param1:int) : void
      {
         if(!var_175)
         {
            var_1633 = param1;
         }
      }
      
      public function set custom(param1:String) : void
      {
         if(!var_175)
         {
            var_1635 = param1;
         }
      }
      
      public function setReadOnly() : void
      {
         var_175 = true;
      }
      
      public function get sex() : String
      {
         return var_1179;
      }
      
      public function get figure() : String
      {
         return var_545;
      }
      
      public function get webID() : int
      {
         return var_1633;
      }
      
      public function get custom() : String
      {
         return var_1635;
      }
      
      public function set y(param1:Number) : void
      {
         if(!var_175)
         {
            _y = param1;
         }
      }
      
      public function set z(param1:Number) : void
      {
         if(!var_175)
         {
            var_75 = param1;
         }
      }
      
      public function set x(param1:Number) : void
      {
         if(!var_175)
         {
            var_74 = param1;
         }
      }
      
      public function get x() : Number
      {
         return var_74;
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function get xp() : int
      {
         return var_1634;
      }
   }
}
