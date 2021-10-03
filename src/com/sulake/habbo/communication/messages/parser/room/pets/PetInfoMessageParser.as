package com.sulake.habbo.communication.messages.parser.room.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetInfoMessageParser implements IMessageParser
   {
       
      
      private var var_1911:int;
      
      private var var_545:String;
      
      private var var_1620:int;
      
      private var var_1903:int;
      
      private var var_1910:int;
      
      private var var_1909:int;
      
      private var _nutrition:int;
      
      private var var_1183:int;
      
      private var var_1906:int;
      
      private var var_1907:int;
      
      private var _energy:int;
      
      private var _name:String;
      
      private var _ownerName:String;
      
      private var var_1912:int;
      
      private var var_1908:int;
      
      public function PetInfoMessageParser()
      {
         super();
      }
      
      public function get level() : int
      {
         return var_1620;
      }
      
      public function get energy() : int
      {
         return _energy;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get maxEnergy() : int
      {
         return var_1909;
      }
      
      public function flush() : Boolean
      {
         var_1183 = -1;
         return true;
      }
      
      public function get maxLevel() : int
      {
         return var_1906;
      }
      
      public function get experienceRequiredToLevel() : int
      {
         return var_1907;
      }
      
      public function get maxNutrition() : int
      {
         return var_1908;
      }
      
      public function get figure() : String
      {
         return var_545;
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function get respect() : int
      {
         return var_1903;
      }
      
      public function get petId() : int
      {
         return var_1183;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         var_1183 = param1.readInteger();
         _name = param1.readString();
         var_1620 = param1.readInteger();
         var_1906 = param1.readInteger();
         var_1910 = param1.readInteger();
         var_1907 = param1.readInteger();
         _energy = param1.readInteger();
         var_1909 = param1.readInteger();
         _nutrition = param1.readInteger();
         var_1908 = param1.readInteger();
         var_545 = param1.readString();
         var_1903 = param1.readInteger();
         var_1912 = param1.readInteger();
         var_1911 = param1.readInteger();
         _ownerName = param1.readString();
         return true;
      }
      
      public function get nutrition() : int
      {
         return _nutrition;
      }
      
      public function get experience() : int
      {
         return var_1910;
      }
      
      public function get ownerId() : int
      {
         return var_1912;
      }
      
      public function get age() : int
      {
         return var_1911;
      }
   }
}
