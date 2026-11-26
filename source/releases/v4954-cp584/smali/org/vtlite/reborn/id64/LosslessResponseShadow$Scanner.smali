.class final Lorg/vtlite/reborn/id64/LosslessResponseShadow$Scanner;
.super Ljava/lang/Object;
.source "LosslessResponseShadow.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/vtlite/reborn/id64/LosslessResponseShadow;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Scanner"
.end annotation


# instance fields
.field final length:I

.field nodes:I

.field offset:I

.field final src:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;)V
    .registers 2

    .line 104
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Scanner;->src:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p1

    iput p1, p0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Scanner;->length:I

    return-void
.end method

.method static digit(C)Z
    .registers 2

    const/16 v0, 0x30

    if-lt p0, v0, :cond_a

    const/16 v0, 0x39

    if-gt p0, v0, :cond_a

    const/4 p0, 0x1

    goto :goto_b

    :cond_a
    const/4 p0, 0x0

    :goto_b
    return p0
.end method

.method static digitOneToNine(C)Z
    .registers 2

    const/16 v0, 0x31

    if-lt p0, v0, :cond_a

    const/16 v0, 0x39

    if-gt p0, v0, :cond_a

    const/4 p0, 0x1

    goto :goto_b

    :cond_a
    const/4 p0, 0x0

    :goto_b
    return p0
.end method


# virtual methods
.method array(I)Ljava/util/List;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/List<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    const/16 v0, 0x5b

    .line 145
    invoke-virtual {p0, v0}, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Scanner;->expect(C)V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const/16 v1, 0x5d

    .line 146
    invoke-virtual {p0, v1}, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Scanner;->take(C)Z

    move-result v2

    if-eqz v2, :cond_13

    return-object v0

    .line 148
    :cond_13
    :goto_13
    invoke-virtual {p0, p1}, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Scanner;->value(I)Ljava/lang/Object;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 149
    invoke-virtual {p0, v1}, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Scanner;->take(C)Z

    move-result v2

    if-eqz v2, :cond_21

    return-object v0

    :cond_21
    const/16 v2, 0x2c

    .line 150
    invoke-virtual {p0, v2}, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Scanner;->expect(C)V

    goto :goto_13
.end method

.method expect(C)V
    .registers 2

    .line 114
    invoke-virtual {p0, p1}, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Scanner;->take(C)Z

    move-result p0

    if-eqz p0, :cond_7

    return-void

    :cond_7
    const-string p0, "invalid JSON document"

    # invokes: Lorg/vtlite/reborn/id64/LosslessResponseShadow;->fail(Ljava/lang/String;)Lorg/vtlite/reborn/id64/LosslessResponseShadow$BoundaryException;
    invoke-static {p0}, Lorg/vtlite/reborn/id64/LosslessResponseShadow;->access$000(Ljava/lang/String;)Lorg/vtlite/reborn/id64/LosslessResponseShadow$BoundaryException;

    move-result-object p0

    throw p0
.end method

.method literal(Ljava/lang/String;)Z
    .registers 6

    .line 128
    iget-object v0, p0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Scanner;->src:Ljava/lang/String;

    iget v1, p0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Scanner;->offset:I

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    const/4 v3, 0x0

    invoke-virtual {v0, v1, p1, v3, v2}, Ljava/lang/String;->regionMatches(ILjava/lang/String;II)Z

    move-result v0

    if-eqz v0, :cond_1a

    iget v0, p0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Scanner;->offset:I

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p1

    add-int/2addr v0, p1

    iput v0, p0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Scanner;->offset:I

    const/4 p0, 0x1

    return p0

    :cond_1a
    return v3
.end method

.method number()Lorg/vtlite/reborn/id64/LosslessResponseShadow$JsonNumber;
    .registers 7

    .line 189
    iget v0, p0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Scanner;->offset:I

    .line 190
    iget-object v1, p0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Scanner;->src:Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v1

    const/16 v2, 0x2d

    if-ne v1, v2, :cond_12

    iget v1, p0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Scanner;->offset:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Scanner;->offset:I

    .line 191
    :cond_12
    iget v1, p0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Scanner;->offset:I

    iget v3, p0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Scanner;->length:I

    const-string v4, "invalid JSON document"

    if-ge v1, v3, :cond_103

    .line 192
    iget-object v3, p0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Scanner;->src:Ljava/lang/String;

    invoke-virtual {v3, v1}, Ljava/lang/String;->charAt(I)C

    move-result v1

    const/16 v3, 0x30

    if-ne v1, v3, :cond_2b

    iget v1, p0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Scanner;->offset:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Scanner;->offset:I

    goto :goto_52

    .line 194
    :cond_2b
    iget-object v1, p0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Scanner;->src:Ljava/lang/String;

    iget v3, p0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Scanner;->offset:I

    invoke-virtual {v1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v1

    invoke-static {v1}, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Scanner;->digitOneToNine(C)Z

    move-result v1

    if-eqz v1, :cond_fe

    .line 195
    :goto_39
    iget v1, p0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Scanner;->offset:I

    iget v3, p0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Scanner;->length:I

    if-ge v1, v3, :cond_52

    iget-object v3, p0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Scanner;->src:Ljava/lang/String;

    invoke-virtual {v3, v1}, Ljava/lang/String;->charAt(I)C

    move-result v1

    invoke-static {v1}, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Scanner;->digit(C)Z

    move-result v1

    if-eqz v1, :cond_52

    iget v1, p0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Scanner;->offset:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Scanner;->offset:I

    goto :goto_39

    .line 197
    :cond_52
    :goto_52
    iget v1, p0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Scanner;->offset:I

    iget v3, p0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Scanner;->length:I

    if-ge v1, v3, :cond_8b

    iget-object v3, p0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Scanner;->src:Ljava/lang/String;

    invoke-virtual {v3, v1}, Ljava/lang/String;->charAt(I)C

    move-result v1

    const/16 v3, 0x2e

    if-ne v1, v3, :cond_8b

    .line 198
    iget v1, p0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Scanner;->offset:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Scanner;->offset:I

    .line 199
    :goto_68
    iget v3, p0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Scanner;->offset:I

    iget v5, p0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Scanner;->length:I

    if-ge v3, v5, :cond_81

    iget-object v5, p0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Scanner;->src:Ljava/lang/String;

    invoke-virtual {v5, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    invoke-static {v3}, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Scanner;->digit(C)Z

    move-result v3

    if-eqz v3, :cond_81

    iget v3, p0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Scanner;->offset:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Scanner;->offset:I

    goto :goto_68

    .line 200
    :cond_81
    iget v3, p0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Scanner;->offset:I

    if-eq v1, v3, :cond_86

    goto :goto_8b

    :cond_86
    # invokes: Lorg/vtlite/reborn/id64/LosslessResponseShadow;->fail(Ljava/lang/String;)Lorg/vtlite/reborn/id64/LosslessResponseShadow$BoundaryException;
    invoke-static {v4}, Lorg/vtlite/reborn/id64/LosslessResponseShadow;->access$000(Ljava/lang/String;)Lorg/vtlite/reborn/id64/LosslessResponseShadow$BoundaryException;

    move-result-object p0

    throw p0

    .line 202
    :cond_8b
    :goto_8b
    iget v1, p0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Scanner;->offset:I

    iget v3, p0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Scanner;->length:I

    if-ge v1, v3, :cond_f0

    iget-object v3, p0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Scanner;->src:Ljava/lang/String;

    invoke-virtual {v3, v1}, Ljava/lang/String;->charAt(I)C

    move-result v1

    const/16 v3, 0x65

    if-eq v1, v3, :cond_a7

    iget-object v1, p0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Scanner;->src:Ljava/lang/String;

    iget v3, p0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Scanner;->offset:I

    invoke-virtual {v1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v1

    const/16 v3, 0x45

    if-ne v1, v3, :cond_f0

    .line 203
    :cond_a7
    iget v1, p0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Scanner;->offset:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Scanner;->offset:I

    .line 204
    iget v3, p0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Scanner;->length:I

    if-ge v1, v3, :cond_cb

    iget-object v3, p0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Scanner;->src:Ljava/lang/String;

    invoke-virtual {v3, v1}, Ljava/lang/String;->charAt(I)C

    move-result v1

    const/16 v3, 0x2b

    if-eq v1, v3, :cond_c5

    iget-object v1, p0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Scanner;->src:Ljava/lang/String;

    iget v3, p0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Scanner;->offset:I

    invoke-virtual {v1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v1

    if-ne v1, v2, :cond_cb

    :cond_c5
    iget v1, p0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Scanner;->offset:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Scanner;->offset:I

    .line 205
    :cond_cb
    iget v1, p0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Scanner;->offset:I

    .line 206
    :goto_cd
    iget v2, p0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Scanner;->offset:I

    iget v3, p0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Scanner;->length:I

    if-ge v2, v3, :cond_e6

    iget-object v3, p0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Scanner;->src:Ljava/lang/String;

    invoke-virtual {v3, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-static {v2}, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Scanner;->digit(C)Z

    move-result v2

    if-eqz v2, :cond_e6

    iget v2, p0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Scanner;->offset:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Scanner;->offset:I

    goto :goto_cd

    .line 207
    :cond_e6
    iget v2, p0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Scanner;->offset:I

    if-eq v1, v2, :cond_eb

    goto :goto_f0

    :cond_eb
    # invokes: Lorg/vtlite/reborn/id64/LosslessResponseShadow;->fail(Ljava/lang/String;)Lorg/vtlite/reborn/id64/LosslessResponseShadow$BoundaryException;
    invoke-static {v4}, Lorg/vtlite/reborn/id64/LosslessResponseShadow;->access$000(Ljava/lang/String;)Lorg/vtlite/reborn/id64/LosslessResponseShadow$BoundaryException;

    move-result-object p0

    throw p0

    .line 209
    :cond_f0
    :goto_f0
    new-instance v1, Lorg/vtlite/reborn/id64/LosslessResponseShadow$JsonNumber;

    iget-object v2, p0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Scanner;->src:Ljava/lang/String;

    iget p0, p0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Scanner;->offset:I

    invoke-virtual {v2, v0, p0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    invoke-direct {v1, p0}, Lorg/vtlite/reborn/id64/LosslessResponseShadow$JsonNumber;-><init>(Ljava/lang/String;)V

    return-object v1

    .line 194
    :cond_fe
    # invokes: Lorg/vtlite/reborn/id64/LosslessResponseShadow;->fail(Ljava/lang/String;)Lorg/vtlite/reborn/id64/LosslessResponseShadow$BoundaryException;
    invoke-static {v4}, Lorg/vtlite/reborn/id64/LosslessResponseShadow;->access$000(Ljava/lang/String;)Lorg/vtlite/reborn/id64/LosslessResponseShadow$BoundaryException;

    move-result-object p0

    throw p0

    .line 191
    :cond_103
    # invokes: Lorg/vtlite/reborn/id64/LosslessResponseShadow;->fail(Ljava/lang/String;)Lorg/vtlite/reborn/id64/LosslessResponseShadow$BoundaryException;
    invoke-static {v4}, Lorg/vtlite/reborn/id64/LosslessResponseShadow;->access$000(Ljava/lang/String;)Lorg/vtlite/reborn/id64/LosslessResponseShadow$BoundaryException;

    move-result-object p0

    throw p0
.end method

.method object(I)Ljava/util/Map;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    const/16 v0, 0x7b

    .line 132
    invoke-virtual {p0, v0}, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Scanner;->expect(C)V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 133
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    const/16 v2, 0x7d

    .line 134
    invoke-virtual {p0, v2}, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Scanner;->take(C)Z

    move-result v3

    if-eqz v3, :cond_18

    return-object v0

    .line 136
    :cond_18
    :goto_18
    invoke-virtual {p0}, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Scanner;->space()V

    invoke-virtual {p0}, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Scanner;->peek()C

    move-result v3

    const/16 v4, 0x22

    if-ne v3, v4, :cond_4d

    .line 137
    invoke-virtual {p0}, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Scanner;->string()Ljava/lang/String;

    move-result-object v3

    .line 138
    invoke-virtual {v1, v3}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_46

    const/16 v4, 0x3a

    .line 139
    invoke-virtual {p0, v4}, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Scanner;->expect(C)V

    invoke-virtual {p0, p1}, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Scanner;->value(I)Ljava/lang/Object;

    move-result-object v4

    invoke-interface {v0, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 140
    invoke-virtual {p0, v2}, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Scanner;->take(C)Z

    move-result v3

    if-eqz v3, :cond_40

    return-object v0

    :cond_40
    const/16 v3, 0x2c

    .line 141
    invoke-virtual {p0, v3}, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Scanner;->expect(C)V

    goto :goto_18

    .line 138
    :cond_46
    const-string p0, "duplicate JSON key"

    # invokes: Lorg/vtlite/reborn/id64/LosslessResponseShadow;->fail(Ljava/lang/String;)Lorg/vtlite/reborn/id64/LosslessResponseShadow$BoundaryException;
    invoke-static {p0}, Lorg/vtlite/reborn/id64/LosslessResponseShadow;->access$000(Ljava/lang/String;)Lorg/vtlite/reborn/id64/LosslessResponseShadow$BoundaryException;

    move-result-object p0

    throw p0

    .line 136
    :cond_4d
    const-string p0, "invalid JSON document"

    # invokes: Lorg/vtlite/reborn/id64/LosslessResponseShadow;->fail(Ljava/lang/String;)Lorg/vtlite/reborn/id64/LosslessResponseShadow$BoundaryException;
    invoke-static {p0}, Lorg/vtlite/reborn/id64/LosslessResponseShadow;->access$000(Ljava/lang/String;)Lorg/vtlite/reborn/id64/LosslessResponseShadow$BoundaryException;

    move-result-object p0

    throw p0
.end method

.method peek()C
    .registers 3

    .line 112
    iget v0, p0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Scanner;->offset:I

    iget v1, p0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Scanner;->length:I

    if-ge v0, v1, :cond_d

    iget-object p0, p0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Scanner;->src:Ljava/lang/String;

    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result p0

    return p0

    :cond_d
    const-string p0, "invalid JSON document"

    # invokes: Lorg/vtlite/reborn/id64/LosslessResponseShadow;->fail(Ljava/lang/String;)Lorg/vtlite/reborn/id64/LosslessResponseShadow$BoundaryException;
    invoke-static {p0}, Lorg/vtlite/reborn/id64/LosslessResponseShadow;->access$000(Ljava/lang/String;)Lorg/vtlite/reborn/id64/LosslessResponseShadow$BoundaryException;

    move-result-object p0

    throw p0
.end method

.method space()V
    .registers 3

    .line 106
    :goto_0
    iget v0, p0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Scanner;->offset:I

    iget v1, p0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Scanner;->length:I

    if-ge v0, v1, :cond_23

    .line 107
    iget-object v1, p0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Scanner;->src:Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x20

    if-eq v0, v1, :cond_1c

    const/16 v1, 0xd

    if-eq v0, v1, :cond_1c

    const/16 v1, 0xa

    if-eq v0, v1, :cond_1c

    const/16 v1, 0x9

    if-ne v0, v1, :cond_23

    .line 108
    :cond_1c
    iget v0, p0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Scanner;->offset:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Scanner;->offset:I

    goto :goto_0

    :cond_23
    return-void
.end method

.method string()Ljava/lang/String;
    .registers 11

    const/16 v0, 0x22

    .line 154
    invoke-virtual {p0, v0}, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Scanner;->expect(C)V

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 155
    :goto_a
    iget v2, p0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Scanner;->offset:I

    iget v3, p0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Scanner;->length:I

    const-string v4, "invalid JSON document"

    if-ge v2, v3, :cond_f0

    .line 156
    iget-object v3, p0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Scanner;->src:Ljava/lang/String;

    add-int/lit8 v5, v2, 0x1

    iput v5, p0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Scanner;->offset:I

    invoke-virtual {v3, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    if-ne v2, v0, :cond_23

    .line 157
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_23
    const/16 v3, 0x20

    if-lt v2, v3, :cond_eb

    const/16 v3, 0x5c

    if-eq v2, v3, :cond_2f

    .line 159
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_a

    .line 160
    :cond_2f
    iget v2, p0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Scanner;->offset:I

    iget v5, p0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Scanner;->length:I

    if-ge v2, v5, :cond_e6

    .line 161
    iget-object v5, p0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Scanner;->src:Ljava/lang/String;

    add-int/lit8 v6, v2, 0x1

    iput v6, p0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Scanner;->offset:I

    invoke-virtual {v5, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    if-eq v2, v0, :cond_e1

    const/16 v5, 0x2f

    if-eq v2, v5, :cond_dc

    if-eq v2, v3, :cond_d7

    const/16 v3, 0x62

    if-eq v2, v3, :cond_d0

    const/16 v3, 0x66

    if-eq v2, v3, :cond_c9

    const/16 v5, 0x6e

    if-eq v2, v5, :cond_c2

    const/16 v5, 0x72

    if-eq v2, v5, :cond_bb

    const/16 v5, 0x74

    if-eq v2, v5, :cond_b4

    const/16 v5, 0x75

    if-ne v2, v5, :cond_af

    .line 172
    iget v2, p0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Scanner;->offset:I

    const/4 v5, 0x4

    add-int/2addr v2, v5

    iget v6, p0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Scanner;->length:I

    if-gt v2, v6, :cond_aa

    const/4 v2, 0x0

    move v6, v2

    :goto_69
    if-ge v2, v5, :cond_a4

    .line 175
    iget-object v7, p0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Scanner;->src:Ljava/lang/String;

    iget v8, p0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Scanner;->offset:I

    add-int/lit8 v9, v8, 0x1

    iput v9, p0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Scanner;->offset:I

    invoke-virtual {v7, v8}, Ljava/lang/String;->charAt(I)C

    move-result v7

    const/16 v8, 0x30

    if-lt v7, v8, :cond_82

    const/16 v8, 0x39

    if-gt v7, v8, :cond_82

    add-int/lit8 v7, v7, -0x30

    goto :goto_97

    :cond_82
    const/16 v8, 0x61

    if-lt v7, v8, :cond_8b

    if-gt v7, v3, :cond_8b

    add-int/lit8 v7, v7, -0x57

    goto :goto_97

    :cond_8b
    const/16 v8, 0x41

    if-lt v7, v8, :cond_96

    const/16 v8, 0x46

    if-gt v7, v8, :cond_96

    add-int/lit8 v7, v7, -0x37

    goto :goto_97

    :cond_96
    const/4 v7, -0x1

    :goto_97
    if-ltz v7, :cond_9f

    shl-int/lit8 v6, v6, 0x4

    or-int/2addr v6, v7

    add-int/lit8 v2, v2, 0x1

    goto :goto_69

    .line 179
    :cond_9f
    # invokes: Lorg/vtlite/reborn/id64/LosslessResponseShadow;->fail(Ljava/lang/String;)Lorg/vtlite/reborn/id64/LosslessResponseShadow$BoundaryException;
    invoke-static {v4}, Lorg/vtlite/reborn/id64/LosslessResponseShadow;->access$000(Ljava/lang/String;)Lorg/vtlite/reborn/id64/LosslessResponseShadow$BoundaryException;

    move-result-object p0

    throw p0

    :cond_a4
    int-to-char v2, v6

    .line 182
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_a

    .line 172
    :cond_aa
    # invokes: Lorg/vtlite/reborn/id64/LosslessResponseShadow;->fail(Ljava/lang/String;)Lorg/vtlite/reborn/id64/LosslessResponseShadow$BoundaryException;
    invoke-static {v4}, Lorg/vtlite/reborn/id64/LosslessResponseShadow;->access$000(Ljava/lang/String;)Lorg/vtlite/reborn/id64/LosslessResponseShadow$BoundaryException;

    move-result-object p0

    throw p0

    .line 183
    :cond_af
    # invokes: Lorg/vtlite/reborn/id64/LosslessResponseShadow;->fail(Ljava/lang/String;)Lorg/vtlite/reborn/id64/LosslessResponseShadow$BoundaryException;
    invoke-static {v4}, Lorg/vtlite/reborn/id64/LosslessResponseShadow;->access$000(Ljava/lang/String;)Lorg/vtlite/reborn/id64/LosslessResponseShadow$BoundaryException;

    move-result-object p0

    throw p0

    :cond_b4
    const/16 v2, 0x9

    .line 170
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_a

    :cond_bb
    const/16 v2, 0xd

    .line 169
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_a

    :cond_c2
    const/16 v2, 0xa

    .line 168
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_a

    :cond_c9
    const/16 v2, 0xc

    .line 167
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_a

    :cond_d0
    const/16 v2, 0x8

    .line 166
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_a

    .line 164
    :cond_d7
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_a

    .line 165
    :cond_dc
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_a

    .line 163
    :cond_e1
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto/16 :goto_a

    .line 160
    :cond_e6
    # invokes: Lorg/vtlite/reborn/id64/LosslessResponseShadow;->fail(Ljava/lang/String;)Lorg/vtlite/reborn/id64/LosslessResponseShadow$BoundaryException;
    invoke-static {v4}, Lorg/vtlite/reborn/id64/LosslessResponseShadow;->access$000(Ljava/lang/String;)Lorg/vtlite/reborn/id64/LosslessResponseShadow$BoundaryException;

    move-result-object p0

    throw p0

    .line 158
    :cond_eb
    # invokes: Lorg/vtlite/reborn/id64/LosslessResponseShadow;->fail(Ljava/lang/String;)Lorg/vtlite/reborn/id64/LosslessResponseShadow$BoundaryException;
    invoke-static {v4}, Lorg/vtlite/reborn/id64/LosslessResponseShadow;->access$000(Ljava/lang/String;)Lorg/vtlite/reborn/id64/LosslessResponseShadow$BoundaryException;

    move-result-object p0

    throw p0

    .line 186
    :cond_f0
    # invokes: Lorg/vtlite/reborn/id64/LosslessResponseShadow;->fail(Ljava/lang/String;)Lorg/vtlite/reborn/id64/LosslessResponseShadow$BoundaryException;
    invoke-static {v4}, Lorg/vtlite/reborn/id64/LosslessResponseShadow;->access$000(Ljava/lang/String;)Lorg/vtlite/reborn/id64/LosslessResponseShadow$BoundaryException;

    move-result-object p0

    throw p0
.end method

.method take(C)Z
    .registers 4

    .line 113
    invoke-virtual {p0}, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Scanner;->space()V

    iget v0, p0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Scanner;->offset:I

    iget v1, p0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Scanner;->length:I

    if-ge v0, v1, :cond_18

    iget-object v1, p0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Scanner;->src:Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    if-ne v0, p1, :cond_18

    iget p1, p0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Scanner;->offset:I

    const/4 v0, 0x1

    add-int/2addr p1, v0

    iput p1, p0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Scanner;->offset:I

    return v0

    :cond_18
    const/4 p0, 0x0

    return p0
.end method

.method value(I)Ljava/lang/Object;
    .registers 4

    const/16 v0, 0x40

    if-gt p1, v0, :cond_71

    .line 116
    iget v0, p0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Scanner;->nodes:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Scanner;->nodes:I

    const v1, 0x186a0

    if-gt v0, v1, :cond_71

    .line 117
    invoke-virtual {p0}, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Scanner;->space()V

    invoke-virtual {p0}, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Scanner;->peek()C

    move-result v0

    const/16 v1, 0x7b

    if-ne v0, v1, :cond_21

    add-int/lit8 p1, p1, 0x1

    .line 118
    invoke-virtual {p0, p1}, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Scanner;->object(I)Ljava/util/Map;

    move-result-object p0

    return-object p0

    :cond_21
    const/16 v1, 0x5b

    if-ne v0, v1, :cond_2c

    add-int/lit8 p1, p1, 0x1

    .line 119
    invoke-virtual {p0, p1}, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Scanner;->array(I)Ljava/util/List;

    move-result-object p0

    return-object p0

    :cond_2c
    const/16 p1, 0x22

    if-ne v0, p1, :cond_35

    .line 120
    invoke-virtual {p0}, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Scanner;->string()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_35
    const/16 p1, 0x2d

    if-eq v0, p1, :cond_6c

    const/16 p1, 0x30

    if-lt v0, p1, :cond_42

    const/16 p1, 0x39

    if-gt v0, p1, :cond_42

    goto :goto_6c

    .line 122
    :cond_42
    const-string p1, "true"

    invoke-virtual {p0, p1}, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Scanner;->literal(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_4d

    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    return-object p0

    .line 123
    :cond_4d
    const-string p1, "false"

    invoke-virtual {p0, p1}, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Scanner;->literal(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_58

    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    return-object p0

    .line 124
    :cond_58
    const-string p1, "null"

    invoke-virtual {p0, p1}, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Scanner;->literal(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_65

    # getter for: Lorg/vtlite/reborn/id64/LosslessResponseShadow;->NULL_VALUE:Ljava/lang/Object;
    invoke-static {}, Lorg/vtlite/reborn/id64/LosslessResponseShadow;->access$200()Ljava/lang/Object;

    move-result-object p0

    return-object p0

    .line 125
    :cond_65
    const-string p0, "invalid JSON document"

    # invokes: Lorg/vtlite/reborn/id64/LosslessResponseShadow;->fail(Ljava/lang/String;)Lorg/vtlite/reborn/id64/LosslessResponseShadow$BoundaryException;
    invoke-static {p0}, Lorg/vtlite/reborn/id64/LosslessResponseShadow;->access$000(Ljava/lang/String;)Lorg/vtlite/reborn/id64/LosslessResponseShadow$BoundaryException;

    move-result-object p0

    throw p0

    .line 121
    :cond_6c
    :goto_6c
    invoke-virtual {p0}, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Scanner;->number()Lorg/vtlite/reborn/id64/LosslessResponseShadow$JsonNumber;

    move-result-object p0

    return-object p0

    .line 116
    :cond_71
    const-string p0, "JSON nesting or node limit"

    # invokes: Lorg/vtlite/reborn/id64/LosslessResponseShadow;->fail(Ljava/lang/String;)Lorg/vtlite/reborn/id64/LosslessResponseShadow$BoundaryException;
    invoke-static {p0}, Lorg/vtlite/reborn/id64/LosslessResponseShadow;->access$000(Ljava/lang/String;)Lorg/vtlite/reborn/id64/LosslessResponseShadow$BoundaryException;

    move-result-object p0

    throw p0
.end method
