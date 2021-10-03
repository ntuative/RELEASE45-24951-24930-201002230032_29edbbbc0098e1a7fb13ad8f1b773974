package com.sulake.habbo.inventory.items
{
   public class FloorItem implements IItem
   {
       
      
      protected var var_2248:Boolean;
      
      protected var var_1377:Number;
      
      protected var var_2250:Boolean;
      
      protected var _type:int;
      
      protected var var_2245:Boolean;
      
      protected var var_1644:int;
      
      protected var var_2249:Boolean;
      
      protected var var_1338:String;
      
      protected var var_1708:int;
      
      protected var _id:int;
      
      protected var _ref:int;
      
      protected var var_1647:String;
      
      protected var var_1704:Boolean;
      
      protected var _category:int;
      
      protected var var_1705:int;
      
      protected var var_2251:int;
      
      protected var var_1703:int;
      
      public function FloorItem(param1:int, param2:int, param3:int, param4:int, param5:Boolean, param6:Boolean, param7:Boolean, param8:Boolean, param9:String, param10:Number, param11:int, param12:int, param13:int, param14:int, param15:String, param16:int)
      {
         super();
         _id = param1;
         _type = param2;
         _ref = param3;
         _category = param4;
         var_1704 = param5;
         var_2249 = param6;
         var_2248 = param7;
         var_2250 = param8;
         var_1338 = param9;
         var_1377 = param10;
         var_2251 = param11;
         var_1703 = param12;
         var_1705 = param13;
         var_1708 = param14;
         var_1647 = param15;
         var_1644 = param16;
      }
      
      public function get locked() : Boolean
      {
         return var_2245;
      }
      
      public function get category() : int
      {
         return _category;
      }
      
      public function get extra() : Number
      {
         return var_1377;
      }
      
      public function set locked(param1:Boolean) : void
      {
         var_2245 = param1;
      }
      
      public function get ref() : int
      {
         return _ref;
      }
      
      public function get songId() : int
      {
         return var_1644;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get sellable() : Boolean
      {
         return var_2250;
      }
      
      public function get slotId() : String
      {
         return var_1647;
      }
      
      public function get expires() : int
      {
         return var_2251;
      }
      
      public function get creationYear() : int
      {
         return var_1708;
      }
      
      public function get creationDay() : int
      {
         return var_1703;
      }
      
      public function get stuffData() : String
      {
         return var_1338;
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function get tradeable() : Boolean
      {
         return var_2249;
      }
      
      public function get groupable() : Boolean
      {
         return var_1704;
      }
      
      public function get creationMonth() : int
      {
         return var_1705;
      }
      
      public function get recyclable() : Boolean
      {
         return var_2248;
      }
   }
}
