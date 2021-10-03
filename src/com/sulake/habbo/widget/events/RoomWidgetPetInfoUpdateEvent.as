package com.sulake.habbo.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetPetInfoUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_129:String = "RWPIUE_PET_INFO";
       
      
      private var var_1620:int;
      
      private var var_1910:int;
      
      private var var_2022:int;
      
      private var _nutrition:int;
      
      private var var_2023:int;
      
      private var var_2027:int;
      
      private var _energy:int;
      
      private var var_965:int;
      
      private var var_2025:int;
      
      private var var_2026:int;
      
      private var var_1911:int;
      
      private var _id:int;
      
      private var _petRespect:int;
      
      private var _canOwnerBeKicked:Boolean;
      
      private var var_2021:int;
      
      private var _image:BitmapData;
      
      private var _ownerName:String;
      
      private var var_2024:Boolean;
      
      private var _name:String;
      
      private var var_495:int;
      
      private var var_1912:int;
      
      public function RoomWidgetPetInfoUpdateEvent(param1:int, param2:int, param3:String, param4:int, param5:BitmapData, param6:Boolean, param7:int, param8:String, param9:int, param10:Boolean = false, param11:Boolean = false)
      {
         super(RoomWidgetPetInfoUpdateEvent.const_129,param10,param11);
         var_965 = param1;
         var_2021 = param2;
         _name = param3;
         _id = param4;
         _image = param5;
         var_2024 = param6;
         var_1912 = param7;
         _ownerName = param8;
         var_2026 = param9;
      }
      
      public function get isOwnPet() : Boolean
      {
         return var_2024;
      }
      
      public function get level() : int
      {
         return var_1620;
      }
      
      public function set levelMax(param1:int) : void
      {
         var_2027 = param1;
      }
      
      public function get energy() : int
      {
         return _energy;
      }
      
      public function set level(param1:int) : void
      {
         var_1620 = param1;
      }
      
      public function get petRace() : int
      {
         return var_2021;
      }
      
      public function set energy(param1:int) : void
      {
         _energy = param1;
      }
      
      public function get nutrition() : int
      {
         return _nutrition;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function set petRespectLeft(param1:int) : void
      {
         var_495 = param1;
      }
      
      public function get experienceMax() : int
      {
         return var_2023;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get nutritionMax() : int
      {
         return var_2022;
      }
      
      public function get ownerId() : int
      {
         return var_1912;
      }
      
      public function set nutrition(param1:int) : void
      {
         _nutrition = param1;
      }
      
      public function set experienceMax(param1:int) : void
      {
         var_2023 = param1;
      }
      
      public function get roomIndex() : int
      {
         return var_2026;
      }
      
      public function get energyMax() : int
      {
         return var_2025;
      }
      
      public function get levelMax() : int
      {
         return var_2027;
      }
      
      public function get petRespect() : int
      {
         return _petRespect;
      }
      
      public function get petRespectLeft() : int
      {
         return var_495;
      }
      
      public function set canOwnerBeKicked(param1:Boolean) : void
      {
         _canOwnerBeKicked = param1;
      }
      
      public function set nutritionMax(param1:int) : void
      {
         var_2022 = param1;
      }
      
      public function get image() : BitmapData
      {
         return _image;
      }
      
      public function set petRespect(param1:int) : void
      {
         _petRespect = param1;
      }
      
      public function set experience(param1:int) : void
      {
         var_1910 = param1;
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function get canOwnerBeKicked() : Boolean
      {
         return _canOwnerBeKicked;
      }
      
      public function get experience() : int
      {
         return var_1910;
      }
      
      public function set energyMax(param1:int) : void
      {
         var_2025 = param1;
      }
      
      public function get petType() : int
      {
         return var_965;
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
