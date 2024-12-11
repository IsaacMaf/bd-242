@startuml Isaac
    entity "TB_GENRES" as gr {
        *GenreId: INTERGER <<PK>>
        Name: NVARCHAR(120)
    }
    entity "TB_MEDIA_TYPES" as mp {
        *MediaTypeId: INTERGER <<PK>>
        Name: NVARCHAR(120)
    }
    entity "TB_PLAYLISTS" as pl {
        *PlaylistId: INTERGER <<PK>>
        Name: NVARCHAR(120)
    }
    entity "TB_PLAYLIST_TRACK" as plt{
        *PlaylistId: INTERGER <<PK>>
        *TrackId: INTERGER <<PK>>
    }
    entity "TB_TRACKS" as tr { 
        *TrackId: INTEGER <<PK>>
        Name: NVARCHAR(200)
        AlbumId: INTEGER <<FK>>
        MediaTypeId: INTEGER <<FK>>
        GenreId: INTEGER <<FK>>
        Composer: NVARCHAR(220)
        Milliseconds: INTEGER
        Bytes: INTEGER
        UnitPrice: NUMERIC
    }
    entity "TB_ARTISTS" as at {
        *ArtistId: INTEGER <<PK>>
        Name: NVARCHAR(120)
    }
    entity "TB_INVOICES" as iv {
        *InvoiceId: INTEGER <<PK>>
        CustomerId: INTEGER <<FK>>
        InvoiceDate: DATETIME
        BillingAddress: NVARCHAR(120)
        BillingCity: NVARCHAR(120)
    }
    entity "TB_INVOICE_ITEMS" as ivi {
        *InvoiceItemld: INTEGER <<PK>>
        InvoiceId: INTEGER <<FK>>
        TrackId: INTEGER <<FK>>
        UnitPrice: NUMERIC
        Quantity: INTEGER
    }
    entity "TB_ALBUMS" as ab {
        *AlbumId: INTEGER <<PK>>
        Title: NVARCHAR(160)
        ArtistiId: INTEGER <<FK>>
    }
    entity "TB_CUSTOMERS" as ct {
        *CustomerId: INTEGER <<PK>>
        FirstName: NVARCHAR(40)
        LastName: NVARCHAR(20)
        Company: NVARCHAR(80)
        Address: NVARCHAR(70)
        City: NVARCHAR(40)
        State: NVARCHAR(40)
        Country: NVARCHAR(40)
        PostalCode: NVARCHAR(10)
        Phone: NVARCHAR(24)
        Fax: NVARCHAR(24)
        Email: NVARCHAR(60)
        SupportRepId: INTEGER
    }
    entity "TB_EMPLOYEES" as ep {
        *EmployeeId: INTEGER <<PK>>
        LastName: NVARCHAR(20)
        FirstName: NVARCHAR(20)
        Title: NVARCHAR(30)
        ReportsTo: INTEGER
        BirthDate: DATETIME
        HireDate: DATETIME
        Address: NVARCHAR(70)
    }
     mp||--o{ tr
     tr||--o| plt
     gr|o--o{tr
     tr}o--o|ab
     tr||--o{ivi
     plt|o--||pl
     at||--o{ab
     ivi}o--||iv
     iv}o--||ct
     ct}o--o|ep
     ep}o--o|ep
     @enduml