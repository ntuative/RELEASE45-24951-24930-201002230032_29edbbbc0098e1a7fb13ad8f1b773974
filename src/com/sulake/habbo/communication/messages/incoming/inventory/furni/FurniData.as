package com.sulake.habbo.communication.messages.incoming.inventory.furni
{
   public class FurniData
   {
       
      
      private var var_1338:String;
      
      private var var_970:String;
      
      private var var_1882:Boolean;
      
      private var var_1377:int;
      
      private var var_1648:int;
      
      private var var_1881:Boolean;
      
      private var var_1647:String = "";
      
      private var var_1645:Boolean;
      
      private var _category:int;
      
      private var _objId:int;
      
      private var var_1123:int;
      
      private var var_1646:Boolean;
      
      private var var_1644:int = -1;
      
      private var var_1649:int;
      
      public function FurniData(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:Boolean, param8:Boolean, param9:Boolean, param10:Boolean, param11:int)
      {
         super();
         var_1648 = param1;
         var_970 = param2;
         _objId = param3;
         var_1123 = param4;
         _category = param5;
         var_1338 = param6;
         var_1882 = param7;
         var_1645 = param8;
         var_1646 = param9;
         var_1881 = param10;
         var_1649 = param11;
      }
      
      public function get slotId() : String
      {
         return var_1647;
      }
      
      public function get extra() : int
      {
         return var_1377;
      }
      
      public function get classId() : int
      {
         return var_1123;
      }
      
      public function get category() : int
      {
         return _category;
      }
      
      public function get isSellable() : Boolean
      {
         return var_1881;
      }
      
      public function get isGroupable() : Boolean
      {
         return var_1882;
      }
      
      public function get stripId() : int
      {
         return var_1648;
      }
      
      public function get stuffData() : String
      {
         return var_1338;
      }
      
      public function get songId() : int
      {
         return var_1644;
      }
      
      public function setExtraData(param1:String, param2:int) : void
      {
         var_1647 = param1;
         var_1377 = param2;
      }
      
      public function get itemType() : String
      {
         return var_970;
      }
      
      public function get objId() : int
      {
         return _objId;
      }
      
      public function get expiryTime() : int
      {
         return var_1649;
      }
      
      public function get isTradeable() : Boolean
      {
         return var_1646;
      }
      
      public function get isRecyclable() : Boolean
      {
         return var_1645;
      }
   }
}
