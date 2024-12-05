@startuml Isaac
    entity "TB_MEDIA_TYPES" as mp {
        *MediaTypeId: INTERGER
        Name: NVARCHAR(120)
    }
    entity "TB_GENRES" as gr {
        *GenreId: INTERGER
        Name: NVARCHAR(120)
    }
    entity "TB_PLAYLISTS" as pl {
        *PlaylistId: INTERGER
        Name: NVARCHAR(120)
    }
    entity "TB_PLAYLIST_TRACK" as plt{
        *PlaylistId: INTERGER
        *TrackId: INTERGER
    }
    entity "TB_TRACKS" as tr { 
        *TrackId: INTEGER
        Name: NVARCHAR(200)
        AlbumId: INTEGER
        MediaTypeId: INTEGER <<FK>>
        GenreId: INTEGER <<FK>>
        Composer: NVARCHAR(220)
        Milliseconds: INTEGER
        Bytes: INTEGER
        UnitPrice: NUMERIC
    }
    entity "TB_ARTISTS" as at {
        *ArtistId: INTEGER
        Name: NVARCHAR(120)
    }
    entity "TB_INVOICES" as iv {
        *InvoiceId: INTEGER
        CustomerId: INTEGER
        InvoiceDate: DATETIME
        BillingAddress: NVARCHAR(120)
        BillingCity: NVARCHAR(120)
    }
    entity "TB_INVOICE_ITEMS" as ivi {
        *InvoiceItemld: INTEGER
        InvoiceId: INTEGER <<FK>>
        TrackId: INTEGER <<FK>>
        UnitPrice: NUMERIC
        Quantity: INTEGER
    }
    entity "TB_ALBUMS" as ab {
        *AlbumId: INTEGER
        Title: NVARCHAR(160)
        ArtistiId: INTEGER <<FK>>
    }
    entity "TB_COSTUMERS" as ct {
        *CustomerId: INTEGER
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
        *EmployeeId: INTEGER
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
     gr|o---o{tr
     tr}o---o|ab
     tr||---o{ivi