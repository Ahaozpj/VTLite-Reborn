.class public final Lorg/vtlite/reborn/id64/ReadOnlyDialogPreview;
.super Ljava/lang/Object;
.source "ReadOnlyDialogPreview.java"


# static fields
.field public static final MAX_RESPONSE_ROWS:I = 0x1000

.field public static final MAX_ROWS:I = 0x14

.field public static final MAX_TITLE_UNITS:I = 0x48


# instance fields
.field private exactPeers:Ljava/util/List;

.field public final labels:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public final totalRows:I


# direct methods
.method private constructor <init>(ILjava/util/List;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    iput p1, p0, Lorg/vtlite/reborn/id64/ReadOnlyDialogPreview;->totalRows:I

    .line 19
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1, p2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-static {p1}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p1

    iput-object p1, p0, Lorg/vtlite/reborn/id64/ReadOnlyDialogPreview;->labels:Ljava/util/List;

    return-void
.end method

.method public static authorizedForProduction()Z
    .registers 1

    const/4 v0, 0x0

    return v0
.end method

.method private static bidi(I)Z
    .registers 2

    const/16 v0, 0x61c

    if-eq p0, v0, :cond_1f

    const/16 v0, 0x200e

    if-eq p0, v0, :cond_1f

    const/16 v0, 0x200f

    if-eq p0, v0, :cond_1f

    const/16 v0, 0x202a

    if-lt p0, v0, :cond_14

    const/16 v0, 0x202e

    if-le p0, v0, :cond_1f

    :cond_14
    const/16 v0, 0x2066

    if-lt p0, v0, :cond_1d

    const/16 v0, 0x2069

    if-gt p0, v0, :cond_1d

    goto :goto_1f

    :cond_1d
    const/4 p0, 0x0

    goto :goto_20

    :cond_1f
    :goto_1f
    const/4 p0, 0x1

    :goto_20
    return p0
.end method

.method public static canNavigate()Z
    .registers 1

    const/4 v0, 0x0

    return v0
.end method

.method public static canPersist()Z
    .registers 1

    const/4 v0, 0x0

    return v0
.end method

.method private static clean(Ljava/lang/String;)Ljava/lang/String;
    .registers 8

    const/4 v0, 0x0

    if-nez p0, :cond_4

    return-object v0

    .line 32
    :cond_4
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v2, 0x0

    .line 33
    :cond_a
    :goto_a
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    if-ge v2, v3, :cond_5e

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    move-result v3

    const/16 v4, 0x48

    if-ge v3, v4, :cond_5e

    .line 34
    invoke-virtual {p0, v2}, Ljava/lang/String;->codePointAt(I)I

    move-result v3

    .line 35
    invoke-static {v3}, Ljava/lang/Character;->charCount(I)I

    move-result v5

    add-int/2addr v2, v5

    .line 36
    invoke-static {v3}, Ljava/lang/Character;->isISOControl(I)Z

    move-result v5

    if-nez v5, :cond_a

    invoke-static {v3}, Lorg/vtlite/reborn/id64/ReadOnlyDialogPreview;->bidi(I)Z

    move-result v5

    if-nez v5, :cond_a

    const/16 v5, 0x2028

    if-eq v3, v5, :cond_a

    const/16 v5, 0x2029

    if-eq v3, v5, :cond_a

    const v5, 0xd800

    if-lt v3, v5, :cond_40

    const v5, 0xdfff

    if-gt v3, v5, :cond_40

    goto :goto_a

    .line 38
    :cond_40
    invoke-static {v3}, Ljava/lang/Character;->isWhitespace(I)Z

    move-result v5

    if-nez v5, :cond_4c

    invoke-static {v3}, Ljava/lang/Character;->isSpaceChar(I)Z

    move-result v5

    if-eqz v5, :cond_4e

    :cond_4c
    const/16 v3, 0x20

    .line 39
    :cond_4e
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    move-result v5

    invoke-static {v3}, Ljava/lang/Character;->charCount(I)I

    move-result v6

    add-int/2addr v5, v6

    if-le v5, v4, :cond_5a

    goto :goto_5e

    .line 40
    :cond_5a
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->appendCodePoint(I)Ljava/lang/StringBuilder;

    goto :goto_a

    .line 42
    :cond_5e
    :goto_5e
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    .line 43
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_6d

    goto :goto_6e

    :cond_6d
    move-object v0, p0

    :goto_6e
    return-object v0
.end method

.method public static fromPage(Lorg/vtlite/reborn/id64/DialogPageModel$Page;)Lorg/vtlite/reborn/id64/ReadOnlyDialogPreview;
    .registers 12

    const/4 v0, 0x0

    if-eqz p0, :cond_a6

    .line 46
    invoke-virtual {p0}, Lorg/vtlite/reborn/id64/DialogPageModel$Page;->cp504NeedsLegacyIdProtection()Z

    move-result v1

    if-nez v1, :cond_b

    goto/16 :goto_a6

    .line 47
    :cond_b
    iget-object v4, p0, Lorg/vtlite/reborn/id64/DialogPageModel$Page;->rows:Ljava/util/List;

    if-eqz v4, :cond_a6

    iget-object v1, p0, Lorg/vtlite/reborn/id64/DialogPageModel$Page;->rows:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    const/16 v2, 0x1000

    if-le v1, v2, :cond_1a

    return-object v0

    .line 49
    :cond_1a
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    new-instance v8, Ljava/util/HashSet;

    invoke-direct {v8}, Ljava/util/HashSet;-><init>()V

    const/4 v3, 0x0

    :goto_2a
    if-ge v3, v1, :cond_9a

    .line 51
    iget-object v4, p0, Lorg/vtlite/reborn/id64/DialogPageModel$Page;->rows:Ljava/util/List;

    invoke-interface {v4, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    instance-of v10, v4, Lorg/vtlite/reborn/id64/DialogPageModel$Row;

    if-eqz v10, :cond_a6

    check-cast v4, Lorg/vtlite/reborn/id64/DialogPageModel$Row;

    iget v10, v4, Lorg/vtlite/reborn/id64/DialogPageModel$Row;->position:I

    if-ne v10, v3, :cond_a6

    iget-object v9, v4, Lorg/vtlite/reborn/id64/DialogPageModel$Row;->peer:Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;

    if-eqz v9, :cond_a6

    iget-object v10, v9, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;->kind:Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;

    sget-object v5, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;->USER:Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;

    if-eq v10, v5, :cond_4e

    sget-object v5, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;->GROUP:Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;

    if-eq v10, v5, :cond_4e

    sget-object v5, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;->CHAT:Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;

    if-ne v10, v5, :cond_a6

    :cond_4e
    invoke-virtual {v8, v9}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_a6

    const/16 v10, 0x14

    if-ge v3, v10, :cond_96

    .line 52
    iget-object v5, v4, Lorg/vtlite/reborn/id64/DialogPageModel$Row;->titleState:Lorg/vtlite/reborn/id64/DialogPageModel$TitleState;

    sget-object v6, Lorg/vtlite/reborn/id64/DialogPageModel$TitleState;->RESOLVED:Lorg/vtlite/reborn/id64/DialogPageModel$TitleState;

    if-ne v5, v6, :cond_65

    iget-object v4, v4, Lorg/vtlite/reborn/id64/DialogPageModel$Row;->title:Ljava/lang/String;

    invoke-static {v4}, Lorg/vtlite/reborn/id64/ReadOnlyDialogPreview;->clean(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    goto :goto_66

    :cond_65
    move-object v4, v0

    :goto_66
    if-nez v4, :cond_78

    .line 53
    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "\u0414\u0438\u0430\u043b\u043e\u0433 "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    add-int/lit8 v5, v3, 0x1

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 55
    :cond_78
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    add-int/lit8 v3, v3, 0x1

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v6, ". "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-interface {v7, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_2a

    :cond_96
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_2a

    .line 57
    :cond_9a
    invoke-static {v7}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    new-instance p0, Lorg/vtlite/reborn/id64/ReadOnlyDialogPreview;

    invoke-direct {p0, v1, v2}, Lorg/vtlite/reborn/id64/ReadOnlyDialogPreview;-><init>(ILjava/util/List;)V

    iput-object v0, p0, Lorg/vtlite/reborn/id64/ReadOnlyDialogPreview;->exactPeers:Ljava/util/List;

    return-object p0

    :cond_a6
    :goto_a6
    return-object v0
.end method


# virtual methods
.method public peerAt(I)Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;
    .registers 4

    iget-object v0, p0, Lorg/vtlite/reborn/id64/ReadOnlyDialogPreview;->exactPeers:Ljava/util/List;

    if-eqz v0, :cond_13

    if-ltz p1, :cond_13

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    if-ge p1, v1, :cond_13

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;

    return-object v0

    :cond_13
    const/4 v0, 0x0

    return-object v0
.end method

.method public screenText()Ljava/lang/String;
    .registers 5

    .line 61
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "ID64 \u00b7 \u041f\u0440\u0435\u0434\u0432\u0430\u0440\u0438\u0442\u0435\u043b\u044c\u043d\u044b\u0439 \u043f\u0440\u043e\u0441\u043c\u043e\u0442\u0440 (\u0442\u043e\u043b\u044c\u043a\u043e \u0447\u0442\u0435\u043d\u0438\u0435)\n"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 62
    iget-object v1, p0, Lorg/vtlite/reborn/id64/ReadOnlyDialogPreview;->labels:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_d
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    const/16 v3, 0xa

    if-eqz v2, :cond_22

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_d

    .line 63
    :cond_22
    iget v1, p0, Lorg/vtlite/reborn/id64/ReadOnlyDialogPreview;->totalRows:I

    iget-object v2, p0, Lorg/vtlite/reborn/id64/ReadOnlyDialogPreview;->labels:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    if-le v1, v2, :cond_40

    const-string v1, "\u2026 \u0415\u0449\u0451 \u0434\u0438\u0430\u043b\u043e\u0433\u0438: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lorg/vtlite/reborn/id64/ReadOnlyDialogPreview;->totalRows:I

    iget-object p0, p0, Lorg/vtlite/reborn/id64/ReadOnlyDialogPreview;->labels:Ljava/util/List;

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result p0

    sub-int/2addr v1, p0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 64
    :cond_40
    const-string p0, "\u041d\u0430\u0436\u043c\u0438\u0442\u0435 \u0434\u043b\u044f \u043f\u043e\u0432\u0442\u043e\u0440\u0430. \u041e\u0442\u043a\u0440\u044b\u0442\u0438\u0435 \u043f\u0435\u0440\u0435\u043f\u0438\u0441\u043e\u043a \u043e\u0442\u043a\u043b\u044e\u0447\u0435\u043d\u043e."

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .registers 1

    .line 24
    const-string p0, "ReadOnlyDialogPreview(REDACTED)"

    return-object p0
.end method
