unit fx_storage;

interface

uses fx_model;

type
   rates_list = array of fx_rate;

procedure store_rate(fx_rate: fx_rate);

function get_rates():rates_list;

implementation

uses sysutils;

type
   rates_file = file of fx_rate;

const
    File_Name = 'fx_rates.dat';

var 
    rate_cache: rates_list;
    loaded: boolean;

function load_from_disk():rates_list;
var 
    read_entry: fx_rate;
    collection: rates_list;
    rate_file: rates_file;
    i : integer;
begin
    i := 0;
    SetLength(collection, i);
    assign(rate_file, File_Name);
    if not FileExists(File_Name)
    then rewrite(rate_file)
    else 
    begin
        reset(rate_file);
        while not eof(rate_file) do
        begin
            read(rate_file, read_entry);
            SetLength(collection, i + 1);
            collection[i] := read_entry;
            i := i + 1;
        end;
    end;
    close(rate_file);
    load_from_disk := collection;
end;

function load_if_needed(): rates_list;
begin
     if not loaded 
     then
     begin
          rate_cache := load_from_disk();
          loaded := true;
     end;
     load_if_needed := rate_cache;
end;

procedure save_to_disk(new_rates: rates_list);
var 
    rate_file: rates_file;
    i : integer;
begin
    assign(rate_file, File_Name);
    rewrite(rate_file);
    for i := 0 to length(new_rates) - 1 do
    begin
        write(rate_file, new_rates[i]);
    end;
    close(rate_file);
end;

procedure store_rate(fx_rate: fx_rate);
var 
   old_rates : rates_list;
   i : integer;
begin
   old_rates := load_if_needed();
   i := Length(old_rates);
   SetLength(old_rates, i + 1);
   old_rates[i] := fx_rate;
   save_to_disk(old_rates);
   rate_cache := old_rates;
end;

function get_rates(): rates_list;
begin
     get_rates := load_if_needed();
end;

end.
