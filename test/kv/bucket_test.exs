defmodule KV.BucketTest do
  use ExUnit.Case, async: true

  setup do
    {:ok, bucket} = KV.Bucket.start_link([])
    %{bucket: bucket}
  end

  test "Stores values by key", %{bucket: bucket} do

    assert KV.Bucket.get(bucket, "milk") == nil

    KV.Bucket.put(bucket, "milk", 3)
    assert KV.Bucket.get(bucket, "milk") == 3
    assert KV.Bucket.get(bucket, "milk") == 3
  end

  test "Deletes key from the bucket", %{bucket: bucket} do
    assert KV.Bucket.get(bucket, "milk") == nil
    assert KV.Bucket.delete(bucket, "milk") == nil

    KV.Bucket.put(bucket, "milk", "organic")
    assert KV.Bucket.get(bucket, "milk") == "organic"

    assert KV.Bucket.delete(bucket, "milk") == "organic"
    assert KV.Bucket.delete(bucket, "milk") == nil

  end
end
