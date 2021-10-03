package com.sulake.habbo.session
{
   public class PetInfo implements IPetInfo
   {
       
      
      private var var_1620:int;
      
      private var var_1903:int;
      
      private var var_1910:int;
      
      private var var_2022:int;
      
      private var _nutrition:int;
      
      private var var_1183:int;
      
      private var var_2027:int;
      
      private var var_2023:int;
      
      private var _energy:int;
      
      private var var_1911:int;
      
      private var var_2025:int;
      
      private var _ownerName:String;
      
      private var var_1912:int;
      
      public function PetInfo()
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
      
      public function set respect(param1:int) : void
      {
         var_1903 = param1;
      }
      
      public function set energy(param1:int) : void
      {
         _energy = param1;
      }
      
      public function set level(param1:int) : void
      {
         var_1620 = param1;
      }
      
      public function get petId() : int
      {
         return var_1183;
      }
      
      public function get experienceMax() : int
      {
         return var_2023;
      }
      
      public function get nutritionMax() : int
      {
         return var_2022;
      }
      
      public function set levelMax(param1:int) : void
      {
         var_2027 = param1;
      }
      
      public function get ownerId() : int
      {
         return var_1912;
      }
      
      public function get nutrition() : int
      {
         return _nutrition;
      }
      
      public function set petId(param1:int) : void
      {
         var_1183 = param1;
      }
      
      public function set nutrition(param1:int) : void
      {
         _nutrition = param1;
      }
      
      public function get energyMax() : int
      {
         return var_2025;
      }
      
      public function get respect() : int
      {
         return var_1903;
      }
      
      public function get levelMax() : int
      {
         return var_2027;
      }
      
      public function set ownerName(param1:String) : void
      {
         _ownerName = param1;
      }
      
      public function set experienceMax(param1:int) : void
      {
         var_2023 = param1;
      }
      
      public function set experience(param1:int) : void
      {
         var_1910 = param1;
      }
      
      public function set nutritionMax(param1:int) : void
      {
         var_2022 = param1;
      }
      
      public function set ownerId(param1:int) : void
      {
         var_1912 = param1;
      }
      
      public function get experience() : int
      {
         return var_1910;
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function set energyMax(param1:int) : void
      {
         var_2025 = param1;
      }
      
      public function set age(param1:int) : void
      {
         var_1911 = param1;
      }
      
      public function get age() : int
      {
         return var_1911;
      }
   }
}
