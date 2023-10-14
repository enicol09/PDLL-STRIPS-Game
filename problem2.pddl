(define (problem problem_name)
    (:domain Packet_1012334)
    (:objects
       ;;countries
          United_Kingdom Canada Mexico Germany
       ;;towns
         London Portsmouth Vancouver Toronto Mexico_City Altamira Hamburg
       ;; Ports
        Vanc_Port Ports_Port Ham_Port Alta_Port
       ;; Ships
         Vanc_ship Port_ship Ham_ship Port2_ship Alta_ship
       ;; Trucks
          Truck_1 Truck_2 Truck_3 Truck_4 Truck_5 Truck_6 Truck_7 Truck_8 Truck_9 Truck_10 Truck_11 Truck_12 Truck_13 Truck_14
       ;; Trains
          Vanc_Train Lond_Train Ham_Train Mex_Train
       ;; Warehouses
          London_Warehouse Vancouver_Warehouse Mexico_City_Warehouse Hamburg_Warehouse
       ;; Stations
       London_station Vancouver_station Portsmouth_station Toronto_station Altamira_station Hamburg_station Mexico_City_station
       ;; Carriage
       Carriage_1 Carriage_2 Carriage_3 Carriage_4 Carriage_5 Carriage_6 Carriage_7 Carriage_8 Carriage_9 Carriage_10 Carriage_11 Carriage_12
       Carriage_13 Carriage_14
       ;; Packets
       Packet_1 Packet_2 Packet_3 Packet_4 Packet_5 Packet_6 Packet_7 Packet_8 Packet_9 Packet_10
       Packet_11 Packet_12 Packet_13 Packet_14 Packet_15 Packet_16 Packet_17 Packet_18 Packet_19 Packet_20
    )

    (:init
    ;;Countries
    (Country United_Kingdom)
    (Country Canada)
    (Country Mexico)
    (Country Germany)

    ;;Towns
        (Town London)
        (Town Vancouver)
        (Town Portsmouth)
        (Town Toronto)
        (Town Mexico_City)
        (Town Altamira)
        (Town Hamburg)

    ;;Town at country initialization
        (at London United_Kingdom)
        (at Portsmouth United_Kingdom)
        (at Vancouver Canada)
        (at Toronto Canada)
        (at Mexico_City Mexico)
        (at Altamira Mexico)
        (at Hamburg Germany)

    ;;locations
         ;;warehouses

        (Storage London_Warehouse)
        (Storage Vancouver_station)
        (Storage Hamburg_Warehouse)
        (Storage Mexico_City_Warehouse)

        (Point_Location London_Warehouse )
        (Point_Location Vancouver_Warehouse)
        (Point_Location Hamburg_Warehouse )
        (Point_Location Mexico_City_Warehouse)

        (at London_Warehouse London)
        (at Vancouver_Warehouse Vancouver)
        (at Hamburg_Warehouse Hamburg)
        (at Mexico_City_Warehouse Mexico_City)

        ;;ports && ships

        (Boat Port_ship)
        (Boat Vanc_ship)
        (Boat Port2_ship)
        (Boat Alta_ship)
        (Boat Ham_ship)

        (at Port_ship Ports_Port)
        (at Port2_ship Ports_Port)
        (at Vanc_ship Vanc_Port)
        (at Alta_ship Alta_Port)
        (at Ham_ship Ham_Port)

        (Point_Location Ports_Port)
        (Point_Location Vanc_Port)
        (Point_Location Alta_Port)
        (Point_Location Ham_Port)

        (Marina_Port Ports_Port)
        (Marina_Port Vanc_Port)
        (Marina_Port Alta_Port)
        (Marina_Port Ham_Port)

        (at Ports_Port Portsmouth)
        (at Vanc_Port Vancouver)
        (at Ham_Port Hamburg)
        (at Alta_Port Altamira)

        ;;Train_Station
        (Train_Station London_station)
        (Train_Station Portsmouth_station)
        (Train_Station Vancouver_station)
        (Train_Station Altamira_station)
        (Train_Station Hamburg_station)
        (Train_Station Toronto_station)
        (Train_Station Mexico_City_station)

        ;;stations
        (Point_Location London_station)
        (Point_Location Vancouver_station)
        (Point_Location Portsmouth_station)
        (Point_Location Altamira_station)
        (Point_Location Hamburg_station)
        (Point_Location Toronto_station)
        (Point_Location Mexico_City_station)

        (at London_station London)
        (at Portsmouth_station Portsmouth)
        (at Vancouver_station Vancouver)
        (at Altamira_station Altamira)
        (at Hamburg_station Hamburg)
        (at Mexico_City_station Mexico_City)
        (at Toronto_station Toronto)

        ;;Train
        (Train Lond_Train)
        (Train Vanc_Train)
        (Train Mex_Train)
        (Train Ham_Train)

        (at Lond_Train London_station)
        (at Vanc_Train Vancouver_station)
        (at Mex_Train Mexico_City_station)
        (at Ham_Train Hamburg_station)


        ;;wagons
         (Carriage Carriage_1)
         (Carriage Carriage_2)
         (Carriage Carriage_3)
         (Carriage Carriage_4)
         (Carriage Carriage_5)
         (Carriage Carriage_6)
         (Carriage Carriage_7)
         (Carriage Carriage_8)
         (Carriage Carriage_9)
         (Carriage Carriage_10)
         (Carriage Carriage_11)
         (Carriage Carriage_12)
         (Carriage Carriage_13)
         (Carriage Carriage_14)

         (at Carriage_1 London_station)
         (at Carriage_2 London_station)

         (at Carriage_3 Portsmouth_station)
         (at Carriage_4 Portsmouth_station)

         (at Carriage_5 Vancouver_station)
         (at Carriage_6 Vancouver_station)

         (at Carriage_7 Altamira_station)
         (at Carriage_8 Altamira_station)

         (at Carriage_9 Toronto_station)
         (at Carriage_10 Toronto_station)

         (at Carriage_11 Hamburg_station)
         (at Carriage_12 Hamburg_station)

         (at Carriage_13 Mexico_City_station)
         (at Carriage_14 Mexico_City_station)

       ;;Trucks
       (Vehicle Truck_1)
       (Vehicle Truck_2)
       (Vehicle Truck_3)
       (Vehicle Truck_4)
       (Vehicle Truck_5)
       (Vehicle Truck_6)
       (Vehicle Truck_7)
       (Vehicle Truck_8)
       (Vehicle Truck_9)
       (Vehicle Truck_10)
       (Vehicle Truck_11)
       (Vehicle Truck_12)
       (Vehicle Truck_13)
       (Vehicle Truck_14)

       (at Truck_1 London_station)
       (at Truck_2 London_Warehouse)

        (at Truck_3 Portsmouth_station)
        (at Truck_4 Portsmouth_station)

        (at Truck_5 Vancouver_station)
        (at Truck_6 Vancouver_Warehouse)

        ;;packets (10)
        (Packet Packet_1)
        (Packet Packet_2)
        (Packet Packet_3)
        (Packet Packet_4)
        (Packet Packet_5)
        (Packet Packet_6)
        (Packet Packet_7)
        (Packet Packet_8)
        (Packet Packet_9)
        (Packet Packet_10)
        (Packet Packet_11)
        (Packet Packet_12)
        (Packet Packet_13)
        (Packet Packet_14)
        (Packet Packet_15)
        (Packet Packet_16)
        (Packet Packet_17)
        (Packet Packet_18)
        (Packet Packet_19)
        (Packet Packet_20)

        (at Packet_1 London_Warehouse)
        (at Packet_2 London_Warehouse)
        (at Packet_3 Hamburg_Warehouse)
        (at Packet_4 Hamburg_Warehouse)
        (at Packet_5 Vancouver_Warehouse)
        (at Packet_6 Vancouver_Warehouse)
        (at Packet_7 Mexico_City_Warehouse)
        (at Packet_8 Mexico_City_Warehouse)
        (at Packet_9 Portsmouth_station )
        (at Packet_10 London_station)
        (at Packet_11 Hamburg_station)
        (at Packet_12 Toronto_station)
        (at Packet_13 Altamira_station)
        (at Packet_14 Portsmouth_station)
        (at Packet_15 Mexico_City_station)
        (at Packet_16 Ports_Port)
        (at Packet_17 Ham_Port)
        (at Packet_18 Vanc_Port)
        (at Packet_19 Alta_Port)
        (at Packet_20 Ports_Port)

         ;todo: put the initial state's facts and numeric values here
    )

    (:goal
        (and
           (at Packet_1 Vancouver_Warehouse)
           (at Packet_2 Portsmouth_station)
           (at Packet_3 London_station)
           (at Packet_4 Vancouver_Warehouse)
           (at Packet_5 Ports_Port)
           (at Packet_6 Vancouver_Warehouse)
           (at Packet_7 Portsmouth_station)
           (at Packet_8 Altamira_station)
           (at Packet_9 Mexico_City_station)
           (at Packet_10 Toronto_station)
           (at Packet_11 Vancouver_Warehouse)
           (at Packet_12 Altamira_station)
           (at Packet_13 Hamburg_Warehouse)
           (at Packet_14 Ham_Port)
           (at Packet_15 Vanc_Port)
           (at Packet_16 Toronto_station)
           (at Packet_17 Mexico_City_Warehouse)
           (at Packet_18 Alta_Port)
           (at Packet_19 Vancouver_station)
           (at Packet_20 London_Warehouse)

        )
    )

)
