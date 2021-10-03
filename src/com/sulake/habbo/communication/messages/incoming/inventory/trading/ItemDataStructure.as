package com.sulake.habbo.communication.messages.incoming.inventory.trading
{
   public class ItemDataStructure
   {
       
      
      private var var_970:String;
      
      private var var_1699:int;
      
      private var var_1707:int;
      
      private var var_1377:int;
      
      private var var_1708:int;
      
      private var _category:int;
      
      private var var_2331:int;
      
      private var var_1703:int;
      
      private var var_1706:int;
      
      private var var_1709:int;
      
      private var var_1705:int;
      
      private var var_1704:Boolean;
      
      private var var_1338:String;
      
      public function ItemDataStructure(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:int, param8:int, param9:int, param10:int, param11:int, param12:Boolean)
      {
         super();
         var_1699 = param1;
         var_970 = param2;
         var_1707 = param3;
         var_1709 = param4;
         _category = param5;
         var_1338 = param6;
         var_1377 = param7;
         var_1706 = param8;
         var_1703 = param9;
         var_1705 = param10;
         var_1708 = param11;
         var_1704 = param12;
      }
      
      public function get itemTypeID() : int
      {
         return var_1709;
      }
      
      public function get extra() : int
      {
         return var_1377;
      }
      
      public function get stuffData() : String
      {
         return var_1338;
      }
      
      public function get groupable() : Boolean
      {
         return var_1704;
      }
      
      public function get creationMonth() : int
      {
         return var_1705;
      }
      
      public function get roomItemID() : int
      {
         return var_1707;
      }
      
      public function get itemType() : String
      {
         return var_970;
      }
      
      public function get itemID() : int
      {
         return var_1699;
      }
      
      public function get songID() : int
      {
         return var_1377;
      }
      
      public function get timeToExpiration() : int
      {
         return var_1706;
      }
      
      public function get creationYear() : int
      {
         return var_1708;
      }
      
      public function get creationDay() : int
      {
         return var_1703;
      }
      
      public function get category() : int
      {
         return _category;
      }
   }
}
