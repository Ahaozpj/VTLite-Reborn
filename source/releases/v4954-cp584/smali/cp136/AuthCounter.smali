.class public final Lcp136/AuthCounter;
.super Ljava/lang/Object;
.source "CP136AuthCounter.java"


# static fields
.field private static final counter:Ljava/util/concurrent/atomic/AtomicInteger;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    sput-object v0, Lcp136/AuthCounter;->counter:Ljava/util/concurrent/atomic/AtomicInteger;

    return-void
.end method

.method public static begin()V
    .registers 2

    sget-object v0, Lcp136/AuthCounter;->counter:Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    return-void
.end method

.method public static count()I
    .registers 1

    sget-object v0, Lcp136/AuthCounter;->counter:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v0

    return v0
.end method

.method public static record()V
    .registers 1

    sget-object v0, Lcp136/AuthCounter;->counter:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    return-void
.end method
