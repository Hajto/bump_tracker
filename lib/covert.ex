defmodule Convert do
  epoch = {{1970, 1, 1}, {0, 0, 0}}
  @epoch :calendar.datetime_to_gregorian_seconds(epoch)

  def from_timestamp(timestamp) do
    DateTime.from_unix!(timestamp)
  end

  def to_timestamp(datetime) do
    NaiveDateTime.diff(~N[2010-04-17 14:00:00], ~N[1970-01-01 00:00:00])
  end
end