package com.sulake.habbo.communication.messages.outgoing.roomsettings
{
   public class SaveableRoomSettingsData
   {
       
      
      private var _password:String;
      
      private var var_1832:int;
      
      private var var_1577:int;
      
      private var var_1833:Boolean;
      
      private var var_1834:Boolean;
      
      private var var_1831:Array;
      
      private var var_1582:Boolean;
      
      private var var_1108:int;
      
      private var _name:String;
      
      private var _roomId:int;
      
      private var var_589:Array;
      
      private var var_1085:String;
      
      public function SaveableRoomSettingsData()
      {
         super();
      }
      
      public function get doorMode() : int
      {
         return var_1577;
      }
      
      public function get description() : String
      {
         return var_1085;
      }
      
      public function get allowFoodConsume() : Boolean
      {
         return var_1834;
      }
      
      public function get maximumVisitors() : int
      {
         return var_1832;
      }
      
      public function set description(param1:String) : void
      {
         var_1085 = param1;
      }
      
      public function get password() : String
      {
         return _password;
      }
      
      public function set allowPets(param1:Boolean) : void
      {
         var_1582 = param1;
      }
      
      public function set maximumVisitors(param1:int) : void
      {
         var_1832 = param1;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get categoryId() : int
      {
         return var_1108;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
      
      public function get controllers() : Array
      {
         return var_1831;
      }
      
      public function get tags() : Array
      {
         return var_589;
      }
      
      public function get allowPets() : Boolean
      {
         return var_1582;
      }
      
      public function set doorMode(param1:int) : void
      {
         var_1577 = param1;
      }
      
      public function set name(param1:String) : void
      {
         _name = param1;
      }
      
      public function set allowWalkThrough(param1:Boolean) : void
      {
         var_1833 = param1;
      }
      
      public function set tags(param1:Array) : void
      {
         var_589 = param1;
      }
      
      public function set roomId(param1:int) : void
      {
         _roomId = param1;
      }
      
      public function set controllers(param1:Array) : void
      {
         var_1831 = param1;
      }
      
      public function set categoryId(param1:int) : void
      {
         var_1108 = param1;
      }
      
      public function get allowWalkThrough() : Boolean
      {
         return var_1833;
      }
      
      public function set password(param1:String) : void
      {
         _password = param1;
      }
      
      public function set allowFoodConsume(param1:Boolean) : void
      {
         var_1834 = param1;
      }
   }
}
