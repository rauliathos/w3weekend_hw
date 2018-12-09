require('pg')

class SqlRunner

  def SqlRunner.run(sql, values = [])
    begin
      db = PG.connect({dbname: 'cinema', host: 'localhost'})
      db.prepare("query", sql)
      results = db.exec_prepared("query", values)
    ensure
      db.close() if db != nil
    end
    return results

  end

end
