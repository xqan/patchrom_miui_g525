.class Landroid/webkit/AccessibilityInjector$CallbackHandler;
.super Ljava/lang/Object;
.source "AccessibilityInjector.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/webkit/AccessibilityInjector;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "CallbackHandler"
.end annotation


# static fields
.field private static final JAVASCRIPT_ACTION_TEMPLATE:Ljava/lang/String; = "javascript:(function() { %s.onResult(%d, %s); })();"

.field private static final RESULT_TIMEOUT:J = 0x1388L


# instance fields
.field private mCallbackRunnable:Ljava/lang/Runnable;

.field private final mInterfaceName:Ljava/lang/String;

.field private final mMainHandler:Landroid/os/Handler;

.field private mResult:Z

.field private mResultId:I

.field private final mResultIdCounter:Ljava/util/concurrent/atomic/AtomicInteger;

.field private final mResultLock:Ljava/lang/Object;


# direct methods
.method private constructor <init>(Ljava/lang/String;)V
    .locals 1
    .parameter "interfaceName"

    .prologue
    .line 818
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 808
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    iput-object v0, p0, Landroid/webkit/AccessibilityInjector$CallbackHandler;->mResultIdCounter:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 809
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Landroid/webkit/AccessibilityInjector$CallbackHandler;->mResultLock:Ljava/lang/Object;

    .line 815
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/webkit/AccessibilityInjector$CallbackHandler;->mResult:Z

    .line 816
    const/4 v0, -0x1

    iput v0, p0, Landroid/webkit/AccessibilityInjector$CallbackHandler;->mResultId:I

    .line 819
    iput-object p1, p0, Landroid/webkit/AccessibilityInjector$CallbackHandler;->mInterfaceName:Ljava/lang/String;

    .line 820
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Landroid/webkit/AccessibilityInjector$CallbackHandler;->mMainHandler:Landroid/os/Handler;

    .line 821
    return-void
.end method

.method synthetic constructor <init>(Ljava/lang/String;Landroid/webkit/AccessibilityInjector$1;)V
    .locals 0
    .parameter "x0"
    .parameter "x1"

    .prologue
    .line 801
    invoke-direct {p0, p1}, Landroid/webkit/AccessibilityInjector$CallbackHandler;-><init>(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$500(Landroid/webkit/AccessibilityInjector$CallbackHandler;Landroid/webkit/WebView;Ljava/lang/String;)Z
    .locals 1
    .parameter "x0"
    .parameter "x1"
    .parameter "x2"

    .prologue
    .line 801
    invoke-direct {p0, p1, p2}, Landroid/webkit/AccessibilityInjector$CallbackHandler;->performAction(Landroid/webkit/WebView;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method private clearResultLocked()V
    .locals 1

    .prologue
    .line 858
    const/4 v0, -0x1

    iput v0, p0, Landroid/webkit/AccessibilityInjector$CallbackHandler;->mResultId:I

    .line 859
    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/webkit/AccessibilityInjector$CallbackHandler;->mResult:Z

    .line 860
    return-void
.end method

.method private getResultAndClear(I)Z
    .locals 4
    .parameter "resultId"

    .prologue
    .line 846
    iget-object v3, p0, Landroid/webkit/AccessibilityInjector$CallbackHandler;->mResultLock:Ljava/lang/Object;

    monitor-enter v3

    .line 847
    :try_start_0
    invoke-direct {p0, p1}, Landroid/webkit/AccessibilityInjector$CallbackHandler;->waitForResultTimedLocked(I)Z

    move-result v1

    .line 848
    .local v1, success:Z
    if-eqz v1, :cond_0

    iget-boolean v0, p0, Landroid/webkit/AccessibilityInjector$CallbackHandler;->mResult:Z

    .line 849
    .local v0, result:Z
    :goto_0
    invoke-direct {p0}, Landroid/webkit/AccessibilityInjector$CallbackHandler;->clearResultLocked()V

    .line 850
    monitor-exit v3

    return v0

    .line 848
    .end local v0           #result:Z
    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    .line 851
    .end local v1           #success:Z
    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v2
.end method

.method private performAction(Landroid/webkit/WebView;Ljava/lang/String;)Z
    .locals 6
    .parameter "webView"
    .parameter "code"

    .prologue
    .line 831
    iget-object v2, p0, Landroid/webkit/AccessibilityInjector$CallbackHandler;->mResultIdCounter:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I

    move-result v0

    .line 832
    .local v0, resultId:I
    const-string v2, "javascript:(function() { %s.onResult(%d, %s); })();"

    const/4 v3, 0x3

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    iget-object v5, p0, Landroid/webkit/AccessibilityInjector$CallbackHandler;->mInterfaceName:Ljava/lang/String;

    aput-object v5, v3, v4

    const/4 v4, 0x1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x2

    aput-object p2, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 834
    .local v1, url:Ljava/lang/String;
    invoke-virtual {p1, v1}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 836
    invoke-direct {p0, v0}, Landroid/webkit/AccessibilityInjector$CallbackHandler;->getResultAndClear(I)Z

    move-result v2

    return v2
.end method

.method private waitForResultTimedLocked(I)Z
    .locals 11
    .parameter "resultId"

    .prologue
    const/4 v7, 0x0

    .line 869
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v3

    .line 871
    .local v3, startTimeMillis:J
    invoke-static {}, Landroid/webkit/AccessibilityInjector;->access$000()Z

    move-result v8

    if-eqz v8, :cond_0

    .line 872
    invoke-static {}, Landroid/webkit/AccessibilityInjector;->access$100()Ljava/lang/String;

    move-result-object v8

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Waiting for CVOX result with ID "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "..."

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 877
    :cond_0
    :goto_0
    iget v8, p0, Landroid/webkit/AccessibilityInjector$CallbackHandler;->mResultId:I

    if-le v8, p1, :cond_2

    .line 878
    invoke-static {}, Landroid/webkit/AccessibilityInjector;->access$000()Z

    move-result v8

    if-eqz v8, :cond_1

    .line 879
    invoke-static {}, Landroid/webkit/AccessibilityInjector;->access$100()Ljava/lang/String;

    move-result-object v8

    const-string v9, "Aborted CVOX result"

    invoke-static {v8, v9}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 904
    :cond_1
    :goto_1
    return v7

    .line 884
    :cond_2
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v8

    sub-long v0, v8, v3

    .line 887
    .local v0, elapsedTimeMillis:J
    invoke-static {}, Landroid/webkit/AccessibilityInjector;->access$000()Z

    move-result v8

    if-eqz v8, :cond_3

    .line 888
    invoke-static {}, Landroid/webkit/AccessibilityInjector;->access$100()Ljava/lang/String;

    move-result-object v8

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Check "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    iget v10, p0, Landroid/webkit/AccessibilityInjector$CallbackHandler;->mResultId:I

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " versus expected "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 890
    :cond_3
    iget v8, p0, Landroid/webkit/AccessibilityInjector$CallbackHandler;->mResultId:I

    if-ne v8, p1, :cond_5

    .line 891
    invoke-static {}, Landroid/webkit/AccessibilityInjector;->access$000()Z

    move-result v7

    if-eqz v7, :cond_4

    .line 892
    invoke-static {}, Landroid/webkit/AccessibilityInjector;->access$100()Ljava/lang/String;

    move-result-object v7

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Received CVOX result after "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " ms"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 894
    :cond_4
    const/4 v7, 0x1

    goto :goto_1

    .line 897
    :cond_5
    const-wide/16 v8, 0x1388

    sub-long v5, v8, v0

    .line 900
    .local v5, waitTimeMillis:J
    const-wide/16 v8, 0x0

    cmp-long v8, v5, v8

    if-gtz v8, :cond_6

    .line 901
    invoke-static {}, Landroid/webkit/AccessibilityInjector;->access$000()Z

    move-result v8

    if-eqz v8, :cond_1

    .line 902
    invoke-static {}, Landroid/webkit/AccessibilityInjector;->access$100()Ljava/lang/String;

    move-result-object v8

    const-string v9, "Timed out while waiting for CVOX result"

    invoke-static {v8, v9}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 908
    :cond_6
    :try_start_0
    invoke-static {}, Landroid/webkit/AccessibilityInjector;->access$000()Z

    move-result v8

    if-eqz v8, :cond_7

    .line 909
    invoke-static {}, Landroid/webkit/AccessibilityInjector;->access$100()Ljava/lang/String;

    move-result-object v8

    const-string v9, "Start waiting..."

    invoke-static {v8, v9}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 911
    :cond_7
    iget-object v8, p0, Landroid/webkit/AccessibilityInjector$CallbackHandler;->mResultLock:Ljava/lang/Object;

    invoke-virtual {v8, v5, v6}, Ljava/lang/Object;->wait(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_0

    .line 912
    :catch_0
    move-exception v2

    .line 913
    .local v2, ie:Ljava/lang/InterruptedException;
    invoke-static {}, Landroid/webkit/AccessibilityInjector;->access$000()Z

    move-result v8

    if-eqz v8, :cond_0

    .line 914
    invoke-static {}, Landroid/webkit/AccessibilityInjector;->access$100()Ljava/lang/String;

    move-result-object v8

    const-string v9, "Interrupted while waiting for CVOX result"

    invoke-static {v8, v9}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0
.end method


# virtual methods
.method public callback()V
    .locals 2
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .prologue
    .line 970
    iget-object v0, p0, Landroid/webkit/AccessibilityInjector$CallbackHandler;->mCallbackRunnable:Ljava/lang/Runnable;

    if-eqz v0, :cond_0

    .line 971
    iget-object v0, p0, Landroid/webkit/AccessibilityInjector$CallbackHandler;->mMainHandler:Landroid/os/Handler;

    iget-object v1, p0, Landroid/webkit/AccessibilityInjector$CallbackHandler;->mCallbackRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 972
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/webkit/AccessibilityInjector$CallbackHandler;->mCallbackRunnable:Ljava/lang/Runnable;

    .line 974
    :cond_0
    return-void
.end method

.method public onResult(Ljava/lang/String;Ljava/lang/String;)V
    .locals 6
    .parameter "id"
    .parameter "result"
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .prologue
    .line 930
    invoke-static {}, Landroid/webkit/AccessibilityInjector;->access$000()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 931
    invoke-static {}, Landroid/webkit/AccessibilityInjector;->access$100()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Saw CVOX result of \'"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "\' for ID "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 936
    :cond_0
    :try_start_0
    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 941
    .local v1, resultId:I
    iget-object v3, p0, Landroid/webkit/AccessibilityInjector$CallbackHandler;->mResultLock:Ljava/lang/Object;

    monitor-enter v3

    .line 942
    :try_start_1
    iget v2, p0, Landroid/webkit/AccessibilityInjector$CallbackHandler;->mResultId:I

    if-le v1, v2, :cond_2

    .line 943
    invoke-static {p2}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result v2

    iput-boolean v2, p0, Landroid/webkit/AccessibilityInjector$CallbackHandler;->mResult:Z

    .line 944
    iput v1, p0, Landroid/webkit/AccessibilityInjector$CallbackHandler;->mResultId:I

    .line 950
    :cond_1
    :goto_0
    iget-object v2, p0, Landroid/webkit/AccessibilityInjector$CallbackHandler;->mResultLock:Ljava/lang/Object;

    invoke-virtual {v2}, Ljava/lang/Object;->notifyAll()V

    .line 951
    monitor-exit v3

    .line 952
    .end local v1           #resultId:I
    :goto_1
    return-void

    .line 937
    :catch_0
    move-exception v0

    .line 938
    .local v0, e:Ljava/lang/NumberFormatException;
    goto :goto_1

    .line 946
    .end local v0           #e:Ljava/lang/NumberFormatException;
    .restart local v1       #resultId:I
    :cond_2
    invoke-static {}, Landroid/webkit/AccessibilityInjector;->access$000()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 947
    invoke-static {}, Landroid/webkit/AccessibilityInjector;->access$100()Ljava/lang/String;

    move-result-object v2

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Result with ID "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " was stale vesus "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, p0, Landroid/webkit/AccessibilityInjector$CallbackHandler;->mResultId:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 951
    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v2
.end method

.method public requestCallback(Landroid/webkit/WebView;Ljava/lang/Runnable;)V
    .locals 2
    .parameter "webView"
    .parameter "callbackRunnable"

    .prologue
    .line 962
    iput-object p2, p0, Landroid/webkit/AccessibilityInjector$CallbackHandler;->mCallbackRunnable:Ljava/lang/Runnable;

    .line 964
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "javascript:(function() { "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Landroid/webkit/AccessibilityInjector$CallbackHandler;->mInterfaceName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ".callback(); })();"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 965
    return-void
.end method
