var db = require('./db');

exports.getAllBooks = function(cb){
    db.query('select * from lms.tbl_book', function(err, result) {
        cb(err, result);
      });
};

exports.addBook = function(book, cb){
    db.beginTransaction(function(err){
        if(err) cb(err, null);
    
        db.query('insert into lms.tbl_book(title, publisher_id) values(?,?)', [book.title, book.publisher_id], function(err, res){
          if(err){
            db.rollback(function(err, res){
              cb(err, res);
            });
          } 
          db.commit(function(err, res){
            cb(err, res);
          });
        });
      });
};

exports.removeBook = function(bookId, cb){
    db.beginTransaction(function(err){
        if(err) cb(err, null);
    
        db.query('delete from lms.book where book_id = ?', [bookId], function(err, res){
          if(err){
            db.rollback(function(err, res){
              cb(err, res);
            });
          } 
          db.commit(function(err, res){
            cb(err, res);
          });
        });
      });
}

exports.updateBook = function(book,callback){
  db.beginTransaction(function(err){
    if(err){
      callback(err,null);
    };
    db.query("update lms.book set title = ?, publisher_id = ?",[book.title, book.publisher_id],function(err,res){
      if(err){
        db.rollback(function(err,res){
          callback(err,res);
        });
      }
      db.commit(function(err,res){
        callback(err,res);
      });
    });
  });
}